# Midheaven: the ecliptic point on the meridian
# RAMC (right ascension of the meridian) is the local sidereal time in degrees.

def midheaven_longitude(local_sidereal_time, obliquity)
    ramc = local_sidereal_time * RADIANS_PER_DEGREE
    e = obliquity * RADIANS_PER_DEGREE
    midheaven = Math.atan2(Math.sin(ramc), Math.cos(ramc) * Math.cos(e))
    return (midheaven * DEGREES_PER_RADIAN) % DEGREES_PER_CIRCLE
end

def porphyry_house_cusps(ascendant, midheaven)
    descendant = (ascendant + 180.0) % DEGREES_PER_CIRCLE
    imum_coeli = (midheaven + 180.0) % DEGREES_PER_CIRCLE
    cusps = Array.new(12)
    cusps[0], cusps[3], cusps[6], cusps[9] = ascendant, imum_coeli, descendant, midheaven
    third = ->(from, to) { ((to - from) % DEGREES_PER_CIRCLE) / 3.0 }

    a = third.(ascendant, imum_coeli)
    cusps[1] = (ascendant + a) % 360;   cusps[2] = (ascendant + 2*a) % 360
    b = third.(imum_coeli, descendant)
    cusps[4] = (imum_coeli + b) % 360;  cusps[5] = (imum_coeli + 2*b) % 360
    c = third.(descendant, midheaven)
    cusps[7] = (descendant + c) % 360;  cusps[8] = (descendant + 2*c) % 360
    d = third.(midheaven, ascendant)
    cusps[10] = (midheaven + d) % 360;  cusps[11] = (midheaven + 2*d) % 360
    return cusps
end
