#String Class Test

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00：47
#2017/05/19    01:50:~03:35
#2017/05/19    10.10~13：05 p248
#2017/05/19    14.33~18:40

#p223 誤字　少数
#p230 誤値

#-------------------------------------------------------------
#                         字符串创建
#-------------------------------------------------------------
puts("-------------------Create---------------------")
a = {"one" => 1, "two" => 2}
p(a, a["one"], a["two"])
a = {one: 11, two: 22}
p(a, a[:one], a[:two])
a = Hash.new(12)
p(a, a["not_key"])


#-------------------------------------------------------------
#                        取出键和值
#-------------------------------------------------------------
puts("-------------------Load---------------------")
a = {a: 1, b: 2, c: 3}
puts("---------all----------")
for temp in a
  print("#{temp}\n")
end
puts("---------key----------")
for temp in a.each_key
  print("#{temp}\n")
end
puts("---------value----------")
for temp in a.each_value
  print("#{temp}\n")
end
p(a.fetch(:a))

#-------------------------------------------------------------
#                        多重哈希
#-------------------------------------------------------------
h = {a: {b: 1}}
p(h[:a][:b])


b = {a: 1, b: 2, c: 3}

if b.has_value?(1) == b.has_key?(:a)
  puts(b.has_value?(1))
  puts(b.has_key?(:a))
