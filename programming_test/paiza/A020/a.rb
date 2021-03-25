lines = readlines.map { |line| line.chomp }
# lines = <<~EOF
# 3
# abc
# cab
# bca
# 3
# aca
# bca
# bcc
# EOF
# lines = <<~EOF
# 4
# abcd
# efgh
# hgfe
# dcba
# 5
# abfgf
# bfgc
# abfga
# hdc
# fghde
# EOF
# lines = <<~EOF
# 1
# b
# 3
# a
# b
# bb
# EOF
# lines = lines.split("\n")
LCOUNT = lines.shift.to_i
ARRAYS = []
LCOUNT.times do
  array = lines.shift.split ''
  ccount = array.length
  ARRAYS.push array
end
SCOUNT = lines.shift.to_i
STRS = []
SCOUNT.times do
  STRS.push lines.shift.split ''
end


# index: current positon of str_array
# trace: [[i, j], ...]
def can_build_str?(str_array, index, builded_str, trace, strs)
  if index == 0
    LCOUNT.times do |i|
      LCOUNT.times do |j|
        if ARRAYS[i][j] == str_array[index]
          new_trace = trace.dup << [i,j]
          new_builded_str = builded_str.dup << ARRAYS[i][j]
          can_build_str? str_array, index+1, new_builded_str, new_trace, strs
        end
      end
    end
  elsif index < str_array.length
    last = trace.last
    i = last[0]; j = last[1]
    right = i + 1
    if right < LCOUNT && ARRAYS[right][j] == str_array[index] && !trace.include?([right, j])
      new_trace = trace.dup << [right, j]
      new_builded_str = builded_str.dup << ARRAYS[right][j]
      can_build_str? str_array, index+1, new_builded_str, new_trace, strs
    end
    left = i - 1
    if left >= 0 && ARRAYS[left][j] == str_array[index] && !trace.include?([left, j])
      new_trace = trace.dup << [left, j]
      new_builded_str = builded_str.dup << ARRAYS[left][j]
      can_build_str? str_array, index+1, new_builded_str, new_trace, strs
    end
    up = j + 1
    if up < LCOUNT && ARRAYS[i][up] == str_array[index] && !trace.include?([i, up])
      new_trace = trace.dup << [i, up]
      new_builded_str = builded_str.dup << ARRAYS[i][up]
      can_build_str? str_array, index+1, new_builded_str, new_trace, strs
    end
    down = j - 1
    if down >= 0 && ARRAYS[i][down] == str_array[index] && !trace.include?([i, down])
      new_trace = trace.dup << [i, down]
      new_builded_str = builded_str.dup << ARRAYS[i][down]
      can_build_str? str_array, index+1, new_builded_str, new_trace, strs
    end
  else
    strs.push builded_str
  end
end




STRS.each do |str_array|
  strs = []
  can_build_str?(str_array, 0, [], [], strs)
  if strs.count > 0
    puts "yes"
  else
    puts "no"
  end
end
