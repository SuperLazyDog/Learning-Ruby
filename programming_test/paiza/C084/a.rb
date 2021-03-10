lines = readlines
# lines = <<~EOS
# <///////+<<</+////
# EOS
# lines = lines.split('\n')

str = lines[0].chomp
length = str.length
3.times do |i|
  if i == 1
    puts "+#{str}+"
  else
    puts Array.new(length+2, "+").join
  end
end
