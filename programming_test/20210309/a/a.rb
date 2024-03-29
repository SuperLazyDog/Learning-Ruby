def main(lines)
  header = lines.shift.split(" ")
  h = header[0].to_i; w = header[1].to_i
  target = lines.pop.chomp
  map = []
  lines.each_index do |i|
    map.push lines[i].chomp.split("")
  end
  # puts "H: #{h}, W: #{w}, T: #{target}"
  # puts "map: #{map}"
  count = process map, target, h, w
  puts "#{count}"
end

def process(map, target, h, w)
  length = target.length
  first = target[0]
  count = 0
  h.times do |i| # i行目
    w.times do |j| # j列目
      if map[i][j] == first
        count += get_num(map, target, i, j, h, w, 0, length, false)
      end
    end
  end
  return count
end

def get_num(map, t, ch, cw, h, w, i, length, only_down)
  if map[ch][cw] == t[i]
    if i < length - 1
        r1 = 0; r2 = 0
      if cw+1 < w && !only_down
        r1 = get_num(map, t, ch, cw+1, h, w, i+1, length, false)
      end
      if ch+1 < h
        r2 = get_num(map, t, ch+1, cw, h, w, i+1, length, true)
      end
      return r1 + r2
    else
      return 1
    end
  else
    return 0
  end
end


main(readlines)


# lines = ["2 3",
# "abc",
# "cba",
# "bca"]
# main(lines)
