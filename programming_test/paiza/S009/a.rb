def get_row(line)
  line.chomp.split(' ').map { |s| s.to_i }
end

def get_patterns(n, opts, cur) ##  => [[pattern1], [pattern2], ...]
  if n == 0
    return [cur]
  else
    tmp = []
    opts.length.times do |i|
      item = opts[i]
      new_opts = opts.dup
      new_opts.delete_at i
      tmp += get_patterns(n-1, new_opts, cur.dup.push(item))
    end
    return tmp
  end
end

def get_index_of(n, pattern, ps)
  position = n + 1
  pattern.each do |pi|
    p = ps[pi]
    position = 1 + p.find_index(position)
  end
  return position - 1
end

def build_array(origin, pattern, ps) # {p1, p,2}  p2 -> p1
  tmp = []
  origin.length.times do |i|
    tmp.push origin[get_index_of(i, pattern, ps)]
  end
  return tmp
end
lines = readlines
# lines = <<~EOS
# 5
# 1 4 2 5 3
# 2
# 5 2 1 4 3
# 1 3 4 5 2
# EOS
# lines = lines.split("\n")
length = lines[0].to_i
data = get_row lines[1]
p_count = lines[2].to_i
ps = lines[3..-1].map { |l| get_row l }
opts = (0...p_count).map { |i| i }
patterns = []
(0..p_count).each { |n| patterns += get_patterns(n, opts, []) }
result = { min: 10, cp: -1, patterns: patterns}
length.times do |i|
  result[:cp] = i
  result[:min] = 10
  result[:patterns].each do |p|
    index = get_index_of i, p, ps
    v = data[index]
    if v < result[:min]
      result[:min] = v
      result[:patterns] = [p]
    elsif v == result[:min]
      result[:patterns].push p
    end
  end
  if result[:patterns].length == 1
    break
  end
end
# puts "result: #{result}, build_array: #{build_array(data, result[:patterns][0], ps)}"
puts build_array(data, result[:patterns][0], ps).join " "
