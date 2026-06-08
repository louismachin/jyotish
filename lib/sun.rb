def sun_geocentric_spherical(t)
    earth_helio = EARTH.heliocentric_spherical(t)
    return SphericalCoordinates.new(
        (earth_helio.longitude + Math::PI) % (2 * Math::PI), # opposite side
        -earth_helio.latitude,                               # mirrored across the plane
        earth_helio.radius,                                  # Earth–Sun distance
    )
end

# Sun's right ascension and declination (both degrees) at a Julian Day.
def sun_equatorial(julian_day)
    t = julian_day_to_t(julian_day)
    ecliptic_longitude = sun_geocentric_spherical(t).longitude # radians
    obliquity = mean_obliquity(julian_day) * RADIANS_PER_DEGREE
  
    right_ascension = Math.atan2(
      Math.cos(obliquity) * Math.sin(ecliptic_longitude),
      Math.cos(ecliptic_longitude)
    )
    declination = Math.asin(Math.sin(obliquity) * Math.sin(ecliptic_longitude))
  
    [(right_ascension * DEGREES_PER_RADIAN) % DEGREES_PER_CIRCLE,
     declination * DEGREES_PER_RADIAN]
end

# Julian Day (UT) of solar noon for a date and observer longitude (east positive).
def solar_noon_julian_day(year, month, day, observer_longitude)
    # Guess: UT noon, shifted by longitude (east transits earlier in UT).
    julian_day = gregorian_datetime_to_julian_day(year, month, day, 12, 0, 0) -
                 observer_longitude / DEGREES_PER_CIRCLE

    2.times do
      right_ascension, _declination = sun_equatorial(julian_day)
      sidereal_time = local_mean_sidereal_time(julian_day, observer_longitude)
      # Hour angle, mapped to -180..180. Zero means on the meridian.
      hour_angle = ((sidereal_time - right_ascension + HALF_CIRCLE) % DEGREES_PER_CIRCLE) - HALF_CIRCLE
      julian_day -= hour_angle / DEGREES_PER_CIRCLE # hour angle moves ~360°/solar day
    end

    return julian_day
end

SUN_HORIZON_ALTITUDE = -0.833   # degrees: refraction + solar semidiameter

# Hour angle (degrees) at which a body sits at the given altitude. nil if it
# never reaches that altitude (polar day or night).
def hour_angle_at_altitude(latitude, declination, altitude)
    cos_hour_angle = (Math.sin(altitude) - Math.sin(latitude) * Math.sin(declination)) /
        (Math.cos(latitude) * Math.cos(declination))
    return nil if cos_hour_angle.abs > 1.0
    Math.acos(cos_hour_angle) * DEGREES_PER_RADIAN
end

# Returns [sunrise_jd, sunset_jd] in UT, or nil if the Sun doesn't rise/set that day.
def sunrise_sunset_julian_day(year, month, day, observer_latitude, observer_longitude)
    transit = solar_noon_julian_day(year, month, day, observer_longitude)
    latitude = observer_latitude * RADIANS_PER_DEGREE
    altitude = SUN_HORIZON_ALTITUDE * RADIANS_PER_DEGREE

    rise = transit
    set  = transit
    3.times do
        _ra_r, declination_rise = sun_equatorial(rise)
        _ra_s, declination_set  = sun_equatorial(set)

        hour_angle_rise = hour_angle_at_altitude(latitude, declination_rise * RADIANS_PER_DEGREE, altitude)
        hour_angle_set  = hour_angle_at_altitude(latitude, declination_set  * RADIANS_PER_DEGREE, altitude)
        return nil if hour_angle_rise.nil? || hour_angle_set.nil?

        rise = transit - hour_angle_rise / 15.0 / 24.0   # degrees → hours → days
        set  = transit + hour_angle_set  / 15.0 / 24.0
    end
    
    return [rise, set]
end