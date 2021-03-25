def get_radian(d)
  d/PI*Math::PI
end

def get_border_radians(p)
  d1 = Math.acos((p[:x]-0).abs/Math.hypot(p[:x], p[:y]))+Math::PI # 0,0
  d2 = -Math.acos((p[:x]-X).abs/Math.hypot(p[:x]-X, p[:y]))+2*Math::PI # x, 0
  d3 = Math.acos((p[:x]-X).abs/Math.hypot(p[:x]-X, p[:y]-Y)) # x, y
  d4 = -Math.acos((p[:x]-0).abs/Math.hypot(p[:x], p[:y]-Y))+Math::PI # 0, y
  return {d1:d1, d2:d2, d3:d3, d4:d4}
end

def get_direction(radian, position)
  borders = get_border_radians(position)
  direction = -1
  if radian > borders[:d2] || radian <= borders[:d3]  # +Y 0
    direction = 0
  elsif radian > borders[:d3] && radian <= borders[:d4] # + X 1
    direction = 1
  elsif radian > borders[:d4] && radian <= borders[:d1] # - Y 2
    direction = 2
  elsif radian > borders[:d1] && radian <= borders[:d2] # - X 3
    direction = 3
  else
    puts "error"
  end
end

def get_new_position(l, position, radian)
  new_x = position[:x] + l * Math.cos(radian)
  new_y = position[:y] + l * Math.sin(radian)
  return {x: new_x, y: new_y}
end

def update(l, position, radian)
  new_p = get_new_position l, position, radian
  new_x = new_p[:x]; new_y =new_p[:y]
  direction = get_direction radian, position
  # puts "direction: #{direction}, new_p: #{new_p}"
  case direction
  when 0 # +Y
    new_radian = Math::PI-radian
    if new_x+R > X
      max_l = ((X-position[:x]-R).abs/Math.cos(radian)).abs
      new_l = l - max_l
      new_position = get_new_position max_l, position, radian
    else
      new_l = l-l
      new_position = new_p
    end
  when 1 # +X
    new_radian = 2*Math::PI-radian
    if new_y+R > Y
      max_l = ((Y-position[:y]-R).abs/Math.cos(radian-Math::PI/2)).abs
      new_l = l - max_l
      new_position = get_new_position max_l, position, radian
    else
      new_l = l-l
      new_position = new_p
    end
  when 2 # -Y
    new_radian = Math::PI-radian
    if new_x-R < 0
      max_l = ((position[:x]-R).abs/Math.cos(Math::PI-radian)).abs
      new_l = l - max_l
      new_position = get_new_position max_l, position, radian
    else
      new_l = l-l
      new_position = new_p
    end
  when 3 # -X
    new_radian = 2*Math::PI-radian
    if new_y-R < 0
      max_l = ((position[:y]-R).abs/Math.sin(Math::PI*2-radian)).abs
      new_l = l - max_l
      new_position = get_new_position max_l, position, radian
    else
      new_l = l-l
      new_position = new_p
    end
  end
  return [new_l, new_position, new_radian]
end

lines = readlines
# a b x y r θ L
# lines = <<~EOS
# 100 100 50 50 2 180 288
# EOS
# lines = lines.split("\n")

data = lines[0].split(' ').map(&:to_i)
X = data[0]
Y = data[1]
OX = data[2]
OY = data[3]
R = data[4]
DEGREE = data[5]
L = data[6]
PI = 180.0
cl = L
cp = {x: OX, y: OY}
cr = get_radian DEGREE

while cl > 0
  # cl = dummy # TODO
  # cp = dummy # TODO
  # cd = dummy # TODO
  tmp = update cl, cp, cr
  cl = tmp[0]; cp = tmp[1]; cr = tmp[2]
  # cl = -1
end

puts cp.values.join(" ")
