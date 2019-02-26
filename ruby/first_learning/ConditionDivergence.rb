#P64
AD = ARGV[0]
AD_INT = AD.to_i
heisei = AD_INT - 1988
puts(heisei)

if "".empty? then
  puts("empty")
else
  puts("have value: #{""}")
end

if (10>1) then
  puts("test")
end

count = 0
while (count < 10) do
  puts(count)
  count += 1
end

if count == 10
  puts("count = 10")
end

a = 0
while a <= 10
  case a
  when 0 then
    puts("a is 0")
  when 1 then
    puts("a is 1")
  when a > 1 #&& a <= 10
    puts("catch a")
  end
  a += 1
  puts("a = #{a}")
end

=begin
while a <= 10
  if a == 0
    puts("a = 0")
  elsif a > 0 && a < 5
    puts("0 < a < 5")
  elsif a >= 5 && a <= 9
    puts("5 <= a <= 9")
  elsif a == 10
    puts("a get it's Max")
  end
  a += 1
end
=end

=begin
count = 0
a = 5
unless a == 5
  puts("a != 5")
else
  puts("a is 5 now")
end
=end
