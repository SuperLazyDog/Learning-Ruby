# W H M N
# x_1 y_1 t_1 d_1 r_1
# x_2 y_2 t_2 d_2 r_2
# ...
# x_M y_M t_M d_M r_M
# a_1 b_1
# a_2 b_2
# ...
# a_N b_N

lines = readlines
# lines = <<~EOS
# 10 10 1 4
# 5 5 90 90 3
# 5 7
# 5 9
# 5 3
# 2 4
# EOS
# lines = lines.split("\n").map { |line| line.chomp.split(' ').map(&:to_i) }
lines = lines.map { |line| line.chomp.split(' ').map(&:to_i) }
info = lines[0]
w = info[0]; h = info[1]
ccount = info[2]; acount = info[3]
cameras = lines[1..ccount].map {|d| {x: d[0], y:d[1], t: d[2], d: d[3], r: d[4]} }
collections = lines[(ccount+1)..-1].map {|d| {x: d[0], y: d[1]} }

def square(x)
  x * x
end

def can_cover?(camera, collection)
  r_2 = square(camera[:x]-collection[:x])+square(camera[:y]-collection[:y])
  if r_2 >= square(camera[:r])
    return false
  end
  h_distance = collection[:x]-camera[:x]
  range = [camera[:t]-camera[:d]/2, camera[:t]+camera[:d]/2]
  degree = Math.acos(h_distance/Math.sqrt(r_2))/Math::PI*180
  if (collection[:y] < camera[:y])
    degree = 360-degree
  end
  if degree > range[0] && degree < range[1]
    return true
  else
    return false
  end
end


result = collections.map do |collection|
  can_cover = false
  cameras.each do |camera|
    if can_cover = can_cover?(camera, collection)
      puts "yes"
      break
    end
  end
  puts "no" if !can_cover
end
