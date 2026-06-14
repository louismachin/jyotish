SIGN_NAMES = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"].freeze

# Inner SVG for each glyph, drawn centred at (0,0) at ~radius 5; stroke/colour come from the wrapping <g>. Elements tagged class="fill" use the glyph colour.
GLYPHS = {
    "Sun"     => %(<circle cx="0" cy="0" r="4.2"/><circle cx="0" cy="0" r="0.7" class="fill"/>),
    "Moon"    => %(<path d="M 1.5,-4.2 A 4.2,4.2 0 1,0 1.5,4.2 A 5.2,5.2 0 0,1 1.5,-4.2 Z"/>),
    "Mercury" => %(<path d="M -2.2,-5.4 A 2.2,2.2 0 0,0 2.2,-5.4"/><circle cx="0" cy="-1.2" r="2.3"/><line x1="0" y1="1.1" x2="0" y2="5.4"/><line x1="-1.7" y1="3.2" x2="1.7" y2="3.2"/>),
    "Venus"   => %(<circle cx="0" cy="-1.6" r="2.4"/><line x1="0" y1="0.8" x2="0" y2="5.4"/><line x1="-1.7" y1="3.1" x2="1.7" y2="3.1"/>),
    "Mars"    => %(<circle cx="-1.1" cy="1.1" r="2.5"/><line x1="0.7" y1="-0.7" x2="4.2" y2="-4.2"/><line x1="1.8" y1="-4.2" x2="4.2" y2="-4.2"/><line x1="4.2" y1="-1.8" x2="4.2" y2="-4.2"/>),
    "Jupiter" => %(<path d="M -3.2,-3.2 C -3.2,-5 -0.5,-5 -0.5,-2.5 L -0.5,4.2"/><line x1="-3.2" y1="2.2" x2="3.6" y2="2.2"/>),
    "Saturn"  => %(<line x1="-2.2" y1="-3.4" x2="1.6" y2="-3.4"/><line x1="-0.3" y1="-5" x2="-0.3" y2="1.5"/><path d="M -0.3,1.5 C -0.3,4.6 3.2,4.6 3.2,1.6"/>),
    "Uranus"  => %(<line x1="-2.6" y1="-4.2" x2="-2.6" y2="2.4"/><line x1="2.6" y1="-4.2" x2="2.6" y2="2.4"/><line x1="-2.6" y1="-1" x2="2.6" y2="-1"/><line x1="0" y1="-4.2" x2="0" y2="2.4"/><circle cx="0" cy="3.7" r="1.0"/><circle cx="0" cy="-4.6" r="0.55" class="fill"/>),
    "Neptune" => %(<path d="M -3.6,-3.8 C -3.6,0 -1.6,1.5 0,1.5 C 1.6,1.5 3.6,0 3.6,-3.8"/><line x1="0" y1="-3.8" x2="0" y2="5"/><line x1="-2.2" y1="3.2" x2="2.2" y2="3.2"/>),
    "Pluto"   => %(<path d="M -2.6,-1.8 A 2.6,2.6 0 1,1 2.6,-1.8"/><circle cx="0" cy="-2.3" r="1.5"/><line x1="0" y1="1.0" x2="0" y2="5"/><line x1="-2.0" y1="3.1" x2="2.0" y2="3.1"/>),
    "Aries"   => %(<path d="M 0,4.5 C 0,-1 -0.4,-4.6 -2.6,-4.6 C -4.4,-4.6 -4.4,-1.6 -2.2,-1.6"/><path d="M 0,4.5 C 0,-1 0.4,-4.6 2.6,-4.6 C 4.4,-4.6 4.4,-1.6 2.2,-1.6"/>),
    "Taurus"  => %(<circle cx="0" cy="1.8" r="3.0"/><path d="M -4.2,-4.4 C -3,-1 3,-1 4.2,-4.4"/>),
    "Gemini"  => %(<path d="M -3.8,-3.6 C -1.5,-4.8 1.5,-4.8 3.8,-3.6"/><path d="M -3.8,3.6 C -1.5,4.8 1.5,4.8 3.8,3.6"/><line x1="-2" y1="-4.0" x2="-2" y2="4.0"/><line x1="2" y1="-4.0" x2="2" y2="4.0"/>),
    "Cancer"  => %(<path d="M -4.5,-1 C -4.5,-3.2 -1.5,-3.6 0.5,-2.4"/><circle cx="-2.5" cy="-1" r="1.2" class="fill"/><path d="M 4.5,1 C 4.5,3.2 1.5,3.6 -0.5,2.4"/><circle cx="2.5" cy="1" r="1.2" class="fill"/>),
    "Leo"     => %(<circle cx="-2.2" cy="1.8" r="2.0"/><path d="M -0.4,0.9 C 1.2,-1 0,-4.6 -2,-4.6 C -4.2,-4.6 -4.6,-1.6 -3.8,0.6"/><path d="M -0.4,0.9 C 1,3 2.4,3.4 4,2.6"/>),
    "Virgo"   => %(<path d="M -4.2,4.4 L -4.2,-3.2 C -4.2,-4.6 -2.2,-4.6 -2.2,-3.2 L -2.2,3.0"/><path d="M -2.2,-3.2 C -2.2,-4.6 -0.2,-4.6 -0.2,-3.2 L -0.2,3.0"/><path d="M -0.2,-3.2 C -0.2,-4.6 1.8,-4.6 1.8,-3.2 L 1.8,2.0 C 1.8,4.2 4,3.8 4.4,2.0"/>),
    "Libra"   => %(<line x1="-4.4" y1="4.0" x2="4.4" y2="4.0"/><line x1="-4.4" y1="0.4" x2="-1.4" y2="0.4"/><line x1="1.4" y1="0.4" x2="4.4" y2="0.4"/><path d="M -1.4,0.4 A 1.6,1.6 0 0,1 1.4,0.4"/>),
    "Scorpio" => %(<path d="M -4.2,4.0 L -4.2,-3.2 C -4.2,-4.6 -2.2,-4.6 -2.2,-3.2 L -2.2,3.0"/><path d="M -2.2,-3.2 C -2.2,-4.6 -0.2,-4.6 -0.2,-3.2 L -0.2,3.0"/><path d="M -0.2,-3.2 C -0.2,-4.6 2.0,-4.6 2.0,-3.2 L 2.0,4.4"/><line x1="2.0" y1="4.4" x2="4.4" y2="2.0"/><line x1="4.4" y1="4.4" x2="4.4" y2="2.0"/><line x1="2.0" y1="4.4" x2="4.4" y2="4.4"/>),
    "Sagittarius" => %(<line x1="-3.4" y1="3.4" x2="3.8" y2="-3.8"/><line x1="1.0" y1="-3.8" x2="3.8" y2="-3.8"/><line x1="3.8" y1="-1.0" x2="3.8" y2="-3.8"/><line x1="-1.6" y1="0.6" x2="1.4" y2="3.6"/>),
    "Capricorn"   => %(<path d="M -4.2,-3.4 L -1.0,3.6 C -0.4,-3.2 1.2,-4.4 2.4,-3.0 C 4.2,-1 1.6,1.6 0.2,0.6 C -1.2,-0.4 0.6,2.8 3.2,2.0"/>),
    "Aquarius"    => %(<path d="M -4.4,-1.6 L -2.6,-3.0 L -0.8,-1.6 L 1.0,-3.0 L 2.8,-1.6 L 4.4,-3.0"/><path d="M -4.4,2.0 L -2.6,0.6 L -0.8,2.0 L 1.0,0.6 L 2.8,2.0 L 4.4,0.6"/>),
    "Pisces"  => %(<path d="M -4.0,-4.0 C -1.6,-2.6 -1.6,2.6 -4.0,4.0"/><path d="M 4.0,-4.0 C 1.6,-2.6 1.6,2.6 4.0,4.0"/><line x1="-2.7" y1="0" x2="2.7" y2="0"/>),
}.freeze

# Element colours (fire, earth, air, water), indexed by sign % 4
ELEMENT_COLORS = ["#c0392b", "#1e8449", "#b08d00", "#2471a3"].freeze
def element_color(sign_index)
    ELEMENT_COLORS[sign_index % 4]
end

# [exact angle, orb, colour, stroke width]; green = harmonious, red = hard
WESTERN_ASPECTS = [
    [0, 8, "#566573", 0.7], [60, 6, "#1e8449", 0.8], [90, 8, "#c0392b", 0.9], [120, 8, "#1e8449", 0.9], [180, 8, "#c0392b", 1.0],
].freeze

def whole_sign_house_cusps(ascendant)
    first = (ascendant / 30.0).floor * 30.0
    (0...12).map { |i| (first + 30.0 * i) % DEGREES_PER_CIRCLE }
end

def render_western_chart(tropical_longitudes, house_cusps = nil, midheaven = nil, output_path)
    size = 760; center = size / 2.0
    r_outer, r_sign_inner = 340.0, 300.0
    r_sign_glyph, r_house_outer, r_house_num = 321.0, 290.0, 274.0
    r_planet, r_hub = 250.0, 128.0
    ink = "#222222"

    ascendant = tropical_longitudes.fetch("Ascendant")
    house_cusps ||= whole_sign_house_cusps(ascendant)

    # Ascendant at the left (180°); longitude increasing counterclockwise.
    to_theta = ->(lon) { 180.0 + (lon - ascendant) }
    point = ->(lon, radius) { th = to_theta.(lon) * RADIANS_PER_DEGREE; [center + radius*Math.cos(th), center - radius*Math.sin(th)] }
    f = ->(v) { v.round(2) }
    line = ->(lon1, r1, lon2, r2, stroke, w) { x1,y1 = point.(lon1,r1); x2,y2 = point.(lon2,r2); %(<line x1="#{f.(x1)}" y1="#{f.(y1)}" x2="#{f.(x2)}" y2="#{f.(y2)}" stroke="#{stroke}" stroke-width="#{w}"/>) }
    glyph = ->(name, lon, radius, scale, color) {
        x,y = point.(lon, radius)
        %(<g transform="translate(#{f.(x)},#{f.(y)}) scale(#{scale})" style="fill:none;stroke:#{color};color:#{color};stroke-width:#{(1.3/scale).round(3)};stroke-linecap:round;stroke-linejoin:round">#{GLYPHS[name]}</g>)
    }

    svg = []
    svg << %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{size} #{size}" width="#{size}" height="#{size}" font-family="Georgia, 'Times New Roman', serif">)
    svg << %(<style>.fill{fill:currentColor}</style>)
    svg << %(<rect width="#{size}" height="#{size}" fill="#ffffff"/>)
    [r_outer, r_sign_inner, r_house_outer, r_hub].each { |r| svg << %(<circle cx="#{center}" cy="#{center}" r="#{r}" fill="none" stroke="#{ink}" stroke-width="0.8"/>) }

    # sign divisions + element-coloured sign glyphs
    12.times do |s|
        svg << line.(s*30.0, r_sign_inner, s*30.0, r_outer, ink, 0.8)
        svg << glyph.(SIGN_NAMES[s], s*30.0 + 15.0, r_sign_glyph, 3.0, element_color(s))
    end

    # 360° degree scale: ticks every 1°, longer at 5° and 10°
    (0...360).each do |d|
        depth = d % 10 == 0 ? 9.0 : (d % 5 == 0 ? 6.0 : 3.0)
        svg << line.(d.to_f, r_sign_inner, d.to_f, r_sign_inner - depth, ink, 0.5)
    end

    # house cusp spokes (angular cusps heavier) + numbers
    house_cusps.each_with_index do |cusp, i|
        svg << line.(cusp, r_house_outer, cusp, r_hub, ink, i % 3 == 0 ? 1.0 : 0.5)
        width = (house_cusps[(i+1)%12] - cusp) % DEGREES_PER_CIRCLE
        nx, ny = point.(cusp + width/2.0, r_house_num)
        svg << %(<text x="#{f.(nx)}" y="#{f.(ny)}" font-size="13" fill="#9a9183" text-anchor="middle" dominant-baseline="central">#{i+1}</text>)
    end

    # ASC/DSC horizon axis with an arrow at the ascendant (left)
    ax, ay = point.(ascendant, r_outer + 6)
    svg << line.(ascendant, r_outer, (ascendant+180) % 360, r_outer, ink, 1.1)
    svg << %(<polygon points="#{f.(ax)},#{f.(ay)} #{f.(ax+9)},#{f.(ay-4)} #{f.(ax+9)},#{f.(ay+4)}" fill="#{ink}"/>)
    svg << %(<text x="#{f.(ax-20)}" y="#{f.(ay)}" font-size="13" fill="#c0392b" text-anchor="middle" dominant-baseline="central">Asc</text>)
    # MC/IC meridian (drawn only if a midheaven longitude is supplied)
    if midheaven
        svg << line.(midheaven, r_outer, (midheaven+180)%360, r_outer, ink, 1.1)
        mx, my = point.(midheaven, r_outer + 6)
        svg << %(<text x="#{f.(mx)}" y="#{f.(my-12)}" font-size="13" fill="#c0392b" text-anchor="middle">MC</text>)
    end

    planets = tropical_longitudes.reject { |n,_| n == "Ascendant" }

    # aspect web (drawn from true positions, behind glyphs)
    names = planets.keys
    names.each_with_index do |a,i|
        names[(i+1)..].each do |b|
            sep = (planets[a]-planets[b]).abs % 360; sep = 360-sep if sep > 180
            WESTERN_ASPECTS.each do |exact, orb, color, w|
                if (sep-exact).abs <= orb
                    svg << line.(planets[a], r_hub, planets[b], r_hub, color, w)
                    break
                end
            end
        end
    end

    # spread glyph display-angles so conjunct planets don't overlap; ticks stay at true longitude
    display = {}; planets.each { |n,l| display[n] = l }
    order = planets.keys.sort_by { |n| planets[n] }
    minimum_separation = 7.5
    12.times do
        order.each_with_index do |n, idx|
            nxt = order[(idx+1) % order.size]
            gap = (display[nxt] - display[n]) % 360
            if gap < minimum_separation
                push = (minimum_separation - gap) / 2.0
                display[n]   = (display[n]   - push) % 360
                display[nxt] = (display[nxt] + push) % 360
            end
        end
    end

    # planets: exact-degree tick (true longitude), leader to the spread glyph, glyph, hub dot
    planets.each do |name, lon|
        color = element_color((lon / 30.0).floor % 12)
        da = display[name]
        svg << line.(lon, r_sign_inner, lon, r_sign_inner - 10, ink, 1.1)
        tx,ty = point.(lon, r_sign_inner - 10); gx,gy = point.(da, r_planet + 16)
        svg << %(<line x1="#{f.(tx)}" y1="#{f.(ty)}" x2="#{f.(gx)}" y2="#{f.(gy)}" stroke="#cfcfcf" stroke-width="0.5"/>)
        svg << glyph.(name, da, r_planet, 3.4, color)
        hx, hy = point.(lon, r_hub); svg << %(<circle cx="#{f.(hx)}" cy="#{f.(hy)}" r="1.6" fill="#{ink}"/>)
    end

    svg << %(</svg>)
    File.write(output_path, svg.join("\n"))
    return output_path
end


__END__

WESTERN_GLYPHS = {
  "Sun"=>"\u2609","Moon"=>"\u263D","Mercury"=>"\u263F","Venus"=>"\u2640",
  "Mars"=>"\u2642","Jupiter"=>"\u2643","Saturn"=>"\u2644","Uranus"=>"\u2645",
  "Neptune"=>"\u2646","Pluto"=>"\u2647",
}.freeze

SIGN_GLYPHS = ["\u2648","\u2649","\u264A","\u264B","\u264C","\u264D",
               "\u264E","\u264F","\u2650","\u2651","\u2652","\u2653"].freeze

WESTERN_ASPECTS = [[0,8],[60,6],[90,8],[120,8],[180,8]].freeze

# Whole-sign cusps: house 1 starts at the ascendant's sign boundary.
def whole_sign_house_cusps(ascendant)
  first = (ascendant / 30.0).floor * 30.0
  (0...12).map { |i| (first + 30.0 * i) % DEGREES_PER_CIRCLE }
end

def render_western_chart(tropical_longitudes, output_path, house_cusps = nil)
  size = 640; center = size / 2.0
  r_outer, r_sign_inner, r_aspect = 300.0, 264.0, 110.0
  r_sign_glyph, r_house_num, r_planet = 282.0, 250.0, 200.0
  ink = "#1A1A1A"; faint = "#9A9183"

  ascendant = tropical_longitudes.fetch("Ascendant")
  house_cusps ||= whole_sign_house_cusps(ascendant)

  # Ascendant at the left (180°); longitude increases counterclockwise.
  to_theta = ->(lon){ 180.0 + (lon - ascendant) }
  point = ->(lon, radius){ th = to_theta.(lon)*RADIANS_PER_DEGREE; [center+radius*Math.cos(th), center-radius*Math.sin(th)] }
  f = ->(v){ v.round(2) }

  svg = []
  svg << %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{size} #{size}" width="#{size}" height="#{size}" font-family="'DejaVu Sans','Segoe UI Symbol',sans-serif">)
  svg << %(<rect width="#{size}" height="#{size}" fill="#F4F1E9"/>)
  [r_outer, r_sign_inner, r_aspect].each { |r| svg << %(<circle cx="#{center}" cy="#{center}" r="#{r}" fill="none" stroke="#{ink}" stroke-width="0.75"/>) }

  # sign band: divisions + glyphs
  12.times do |s|
    b = s*30.0
    ix,iy = point.(b,r_sign_inner); ox,oy = point.(b,r_outer)
    svg << %(<line x1="#{f.(ix)}" y1="#{f.(iy)}" x2="#{f.(ox)}" y2="#{f.(oy)}" stroke="#{ink}" stroke-width="0.75"/>)
    gx,gy = point.(b+15.0, r_sign_glyph)
    svg << %(<text x="#{f.(gx)}" y="#{f.(gy)}" font-size="20" fill="#{ink}" text-anchor="middle" dominant-baseline="central">#{SIGN_GLYPHS[s]}</text>)
  end

  # degree ticks (longer every 10°)
  (0...360).step(5) do |d|
    inner = d%10==0 ? r_sign_inner-7 : r_sign_inner-4
    x1,y1 = point.(d.to_f, r_sign_inner); x2,y2 = point.(d.to_f, inner)
    svg << %(<line x1="#{f.(x1)}" y1="#{f.(y1)}" x2="#{f.(x2)}" y2="#{f.(y2)}" stroke="#{ink}" stroke-width="0.5"/>)
  end

  # house cusp spokes + numbers (angular houses 1/4/7/10 a touch heavier)
  house_cusps.each_with_index do |cusp, i|
    x1,y1 = point.(cusp, r_sign_inner); x2,y2 = point.(cusp, r_aspect)
    heavier = (i % 3 == 0)
    svg << %(<line x1="#{f.(x1)}" y1="#{f.(y1)}" x2="#{f.(x2)}" y2="#{f.(y2)}" stroke="#{ink}" stroke-width="#{heavier ? 0.9 : 0.5}"/>)
    nxt = house_cusps[(i+1)%12]
    width = (nxt - cusp) % DEGREES_PER_CIRCLE
    nx,ny = point.(cusp + width/2.0, r_house_num)
    svg << %(<text x="#{f.(nx)}" y="#{f.(ny)}" font-size="11" fill="#{faint}" text-anchor="middle" dominant-baseline="central">#{i+1}</text>)
  end

  # horizon axis (Ascendant–Descendant)
  ax,ay = point.(ascendant, r_outer); dx,dy = point.((ascendant+180)%360, r_outer)
  svg << %(<line x1="#{f.(ax)}" y1="#{f.(ay)}" x2="#{f.(dx)}" y2="#{f.(dy)}" stroke="#{ink}" stroke-width="1.25"/>)
  svg << %(<text x="#{f.(ax-17)}" y="#{f.(ay)}" font-size="11" fill="#{ink}" text-anchor="middle" dominant-baseline="central">ASC</text>)

  planets = tropical_longitudes.reject { |n,_| n == "Ascendant" }

  # aspect web
  names = planets.keys
  names.each_with_index do |a,i|
    names[(i+1)..].each do |b|
      sep = (planets[a]-planets[b]).abs % 360; sep = 360-sep if sep>180
      WESTERN_ASPECTS.each do |exact,orb|
        if (sep-exact).abs <= orb
          x1,y1 = point.(planets[a], r_aspect); x2,y2 = point.(planets[b], r_aspect)
          svg << %(<line x1="#{f.(x1)}" y1="#{f.(y1)}" x2="#{f.(x2)}" y2="#{f.(y2)}" stroke="#{ink}" stroke-width="0.5" opacity="0.5"/>)
          break
        end
      end
    end
  end

  # planets
  planets.each do |name, lon|
    glyph = WESTERN_GLYPHS.fetch(name, name[0])
    t1x,t1y = point.(lon, r_sign_inner); t2x,t2y = point.(lon, r_planet+11)
    svg << %(<line x1="#{f.(t1x)}" y1="#{f.(t1y)}" x2="#{f.(t2x)}" y2="#{f.(t2y)}" stroke="#{ink}" stroke-width="0.5"/>)
    px,py = point.(lon, r_planet)
    svg << %(<text x="#{f.(px)}" y="#{f.(py)}" font-size="18" fill="#{ink}" text-anchor="middle" dominant-baseline="central">#{glyph}</text>)
    ox,oy = point.(lon, r_aspect)
    svg << %(<circle cx="#{f.(ox)}" cy="#{f.(oy)}" r="1.5" fill="#{ink}"/>)
  end

  svg << %(</svg>)
  File.write(output_path, svg.join("\n"))
  output_path
end

__END__

WESTERN_GLYPHS = {
  "Sun" => "\u2609", "Moon" => "\u263D", "Mercury" => "\u263F",
  "Venus" => "\u2640", "Mars" => "\u2642", "Jupiter" => "\u2643",
  "Saturn" => "\u2644", "Uranus" => "\u2645", "Neptune" => "\u2646",
  "Pluto" => "\u2647",
}.freeze

# Aries … Pisces, in zodiac order.
SIGN_GLYPHS = ["\u2648","\u2649","\u264A","\u264B","\u264C","\u264D",
               "\u264E","\u264F","\u2650","\u2651","\u2652","\u2653"].freeze

# [exact angle, orb] for the five Ptolemaic aspects.
WESTERN_ASPECTS = [[0, 8], [60, 6], [90, 8], [120, 8], [180, 8]].freeze

def render_western_chart(tropical_longitudes, output_path)
    size = 640
    center = size / 2.0
    r_outer, r_sign_inner, r_sign_glyph = 300.0, 255.0, 277.0
    r_planet, r_aspect = 215.0, 120.0
    ink = "#1A1A1A"

    ascendant = tropical_longitudes.fetch("Ascendant")

    # Screen polar angle: ascendant at the left (180°), longitude increasing
    # counterclockwise - the standard Western horizon orientation.
    to_theta = ->(lon) { 180.0 + (lon - ascendant) }
    point = ->(lon, radius) {
        th = to_theta.call(lon) * RADIANS_PER_DEGREE
        [center + radius * Math.cos(th), center - radius * Math.sin(th)]
    }
    fmt = ->(v) { v.round(2) }

    svg = []
    svg << %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{size} #{size}" width="#{size}" height="#{size}" font-family="'DejaVu Sans','Segoe UI Symbol',sans-serif">)
    svg << %(<rect width="#{size}" height="#{size}" fill="#F4F1E9"/>)

    [r_outer, r_sign_inner, r_aspect].each do |radius|
        svg << %(<circle cx="#{center}" cy="#{center}" r="#{radius}" fill="none" stroke="#{ink}" stroke-width="0.75"/>)
    end

    # sign divisions (every 30°) and sign glyphs centred in each sector
    12.times do |s|
        b = s * 30.0
        ix, iy = point.call(b, r_sign_inner); bx, by = point.call(b, r_outer)
        svg << %(<line x1="#{fmt.(ix)}" y1="#{fmt.(iy)}" x2="#{fmt.(bx)}" y2="#{fmt.(by)}" stroke="#{ink}" stroke-width="0.75"/>)
        gx, gy = point.call(b + 15.0, r_sign_glyph)
        svg << %(<text x="#{fmt.(gx)}" y="#{fmt.(gy)}" font-size="20" fill="#{ink}" text-anchor="middle" dominant-baseline="central">#{SIGN_GLYPHS[s]}</text>)
    end

    # degree ticks, longer every 10°
    (0...360).step(5) do |d|
        inner = d % 10 == 0 ? r_sign_inner - 8 : r_sign_inner - 4
        x1, y1 = point.call(d.to_f, r_sign_inner); x2, y2 = point.call(d.to_f, inner)
        svg << %(<line x1="#{fmt.(x1)}" y1="#{fmt.(y1)}" x2="#{fmt.(x2)}" y2="#{fmt.(y2)}" stroke="#{ink}" stroke-width="0.5"/>)
    end

    # horizon axis (Ascendant–Descendant), slightly heavier
    ax, ay = point.call(ascendant, r_outer); dx, dy = point.call((ascendant + 180) % 360, r_outer)
    svg << %(<line x1="#{fmt.(ax)}" y1="#{fmt.(ay)}" x2="#{fmt.(dx)}" y2="#{fmt.(dy)}" stroke="#{ink}" stroke-width="1.25"/>)
    svg << %(<text x="#{fmt.(ax - 16)}" y="#{fmt.(ay)}" font-size="11" fill="#{ink}" text-anchor="middle" dominant-baseline="central">ASC</text>)

    planets = tropical_longitudes.reject { |n, _| n == "Ascendant" }

    # aspect web (drawn first, behind glyphs)
    names = planets.keys
    names.each_with_index do |a, i|
        names[(i + 1)..].each do |b|
            sep = (planets[a] - planets[b]).abs % 360
            sep = 360 - sep if sep > 180
            WESTERN_ASPECTS.each do |exact, orb|
                if (sep - exact).abs <= orb
                    x1, y1 = point.call(planets[a], r_aspect); x2, y2 = point.call(planets[b], r_aspect)
                    svg << %(<line x1="#{fmt.(x1)}" y1="#{fmt.(y1)}" x2="#{fmt.(x2)}" y2="#{fmt.(y2)}" stroke="#{ink}" stroke-width="0.5" opacity="0.55"/>)
                    break
                end
            end
        end
    end

    # planet glyphs, radial tick to the exact degree, dot on the aspect circle
    planets.each do |name, lon|
        glyph = WESTERN_GLYPHS.fetch(name, name[0])
        t1x, t1y = point.call(lon, r_sign_inner); t2x, t2y = point.call(lon, r_planet + 12)
        svg << %(<line x1="#{fmt.(t1x)}" y1="#{fmt.(t1y)}" x2="#{fmt.(t2x)}" y2="#{fmt.(t2y)}" stroke="#{ink}" stroke-width="0.5"/>)
        px, py = point.call(lon, r_planet)
        svg << %(<text x="#{fmt.(px)}" y="#{fmt.(py)}" font-size="18" fill="#{ink}" text-anchor="middle" dominant-baseline="central">#{glyph}</text>)
        ox, oy = point.call(lon, r_aspect)
        svg << %(<circle cx="#{fmt.(ox)}" cy="#{fmt.(oy)}" r="1.5" fill="#{ink}"/>)
    end

    svg << %(</svg>)
    File.write(output_path, svg.join("\n"))
    output_path
end