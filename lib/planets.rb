MERCURY = CelestialBody.new(File.expand_path('./datasets/VSOP87D.mer'))
VENUS   = CelestialBody.new(File.expand_path('./datasets/VSOP87D.ven'))
EARTH   = CelestialBody.new(File.expand_path('./datasets/VSOP87D.ear'))
MARS    = CelestialBody.new(File.expand_path('./datasets/VSOP87D.mar'))
JUPITER = CelestialBody.new(File.expand_path('./datasets/VSOP87D.jup'))
SATURN  = CelestialBody.new(File.expand_path('./datasets/VSOP87D.sat'))
URANUS  = CelestialBody.new(File.expand_path('./datasets/VSOP87D.ura'))
NEPTUNE = CelestialBody.new(File.expand_path('./datasets/VSOP87D.nep'))

PLANETS = {
    "Mercury" => MERCURY,
    "Venus"   => VENUS,
    "Mars"    => MARS,
    "Jupiter" => JUPITER,
    "Saturn"  => SATURN,
    "Uranus"  => URANUS,
    "Neptune" => NEPTUNE,
    # NOTE: Pluto is not mapped using VSOP87D datasets
}