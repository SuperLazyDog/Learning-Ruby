#----------------------------------------------
#              测试各种数组类方法
#----------------------------------------------
puts("----------------------------------------")
puts("                  1.1")
puts("----------------------------------------")
a = []
r = Random.new

10_000.times do
  a.push(r.rand(10000))
end
count = 0
b = a.sort { |a, b|
  count += 1
  b <=> a
}

puts b
puts "count: #{count}"
#----------------------------------------------
#              测试each_with_index
#----------------------------------------------
puts("----------------------------------------")
puts("                  1.2")
puts("----------------------------------------")
10.times.each.with_index(1) do |i|
  puts "i = #{i}"
end

a = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.each.with_index(100) do |a, i|
  puts "a[#{i}] = #{a}"
end
