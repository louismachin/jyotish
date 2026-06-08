MERCURY = CelestialBody.new(File.expand_path('../datasets/VSOP87D.mer', __dir__))
VENUS   = CelestialBody.new(File.expand_path('../datasets/VSOP87D.ven', __dir__))
EARTH   = CelestialBody.new(File.expand_path('../datasets/VSOP87D.ear', __dir__))
MARS    = CelestialBody.new(File.expand_path('../datasets/VSOP87D.mar', __dir__))
JUPITER = CelestialBody.new(File.expand_path('../datasets/VSOP87D.jup', __dir__))
SATURN  = CelestialBody.new(File.expand_path('../datasets/VSOP87D.sat', __dir__))
URANUS  = CelestialBody.new(File.expand_path('../datasets/VSOP87D.ura', __dir__))
NEPTUNE = CelestialBody.new(File.expand_path('../datasets/VSOP87D.nep', __dir__))

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