require_relative './math'
require_relative './zodiac'
require_relative './celestial_body'

julian_day = gregorian_calendar_to_julian_day(1999, 1, 6, 12.0)
t          = julian_day_to_t(julian_day)
ayanamsa   = lahiri_ayanamsa(julian_day)

mercury = CelestialBody.new('./VSOP87D.mer')
venus = CelestialBody.new('./VSOP87D.ven')
earth = CelestialBody.new('./VSOP87D.ear')
mars = CelestialBody.new('./VSOP87D.mar')
jupiter = CelestialBody.new('./VSOP87D.jup')
saturn = CelestialBody.new('./VSOP87D.sat')
uranus = CelestialBody.new('./VSOP87D.ura')
neptune = CelestialBody.new('./VSOP87D.nep')

timezone_offset = 0 # GMT
julian_day = gregorian_datetime_to_julian_day(1999, 1, 6, 20, 2, timezone_offset)

PLANETS = {
    "Mercury"  => mercury,
    "Venus"    => venus,
    "Mars"     => mars,
    "Jupiter"  => jupiter,
    "Saturn"   => saturn,
    "Uranus"   => uranus,
    "Neptune"  => neptune,
}

t        = julian_day_to_t(julian_day)
ayanamsa = lahiri_ayanamsa(julian_day)

earth_cartesian = earth.cartesian_coordinate(t)

# Sun: Earth heliocentric longitude + 180
sun_tropical = ((earth.coordinate(CelestialBody::LONGITUDE, t) * 180 / Math::PI) + 180) % 360
puts "Sun #{zodiac_position(sun_tropical, ayanamsa)}"

# Planets: geocentric = planet_heliocentric - earth_heliocentric
PLANETS.each do |name, body|
    geocentric = cartesian_to_spherical(body.cartesian_coordinate(t) - earth_cartesian)
    tropical_degrees = geocentric.longitude * 180 / Math::PI
    puts "#{name} #{zodiac_position(tropical_degrees, ayanamsa)}"
end

__END__

require_relative './check'

earth_checks = load_checks.select { |check| check.version == 'D' && check.body.upcase == 'EARTH' }
earth_checks.sample(5).each do |check|
    t = (check.julian_day - 2451545.0) / 365250.0
    longitude = earth.coordinate(1, t) % (2 * Math::PI)
    latitude  = earth.coordinate(2, t)
    radius    = earth.coordinate(3, t)
    puts "Julian Day: #{check.julian_day}"
    puts "- longitude: computed #{longitude.round(10)}, expected #{check.longitude}"
    puts "- latitude:  computed #{latitude.round(10)}, expected #{check.latitude}"
    puts "- radius:    computed #{radius.round(10)}, expected #{check.radius}"
end