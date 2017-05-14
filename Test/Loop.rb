#loop test file
puts("----------------------------------------")
puts("               times")
time = 7
time.times do |temp|
  puts("Times Loop: #{temp}")
end
=begin
puts("----------------------------------------")
puts("")
if time > 0
  puts("test")
end
=end
puts("----------------------------------------")
puts("                 for")
for i in 1..5 do
  puts("For Loop: #{i}")
end
puts("----------------------------------------")
puts("                while")
i = 1
while i < 3 do
  puts("While Loop: #{i}")
  i += 1
end
puts("----------------------------------------")
puts("               until")
i = 0
until i > 5 do
  puts("Until Loop: #{i}")
  i += 1
end

puts("----------------------------------------")
puts("               each")
range = 0..4
range.each do |temp|
  puts("Each Loop: #{temp}")
end

puts("----------------------------------------")
puts("               loop")
i = 0
loop do
  puts("Loop loop: #{i}")
  i += 1
  if i > 50 then
    break
  end
end

puts("----------------------------------------")
puts("             other test")
puts("            break and next")
range = 1...100
for i in range do
  if i > 50 then #50以上就退出
    puts("Break")
    break
  end
  if i < 10 then
    puts("Next")
    next
  end
  puts("now Num: #{i}")
end
