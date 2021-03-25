lines = readlines
# lines = <<~EOS
# 1 80 40
# EOS
# lines = lines.split('\n')

line = lines[0].chomp.split(' ').map {|s| s.to_i}
puts line[0]*(100-line[1])*(100-line[2])/10000.0
