#Array

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
#2017/05/19    14.33~

#p223 誤字　少数
#p230 誤値

#-------------------------------------------------------------
#                           数组创建
#-------------------------------------------------------------
arraytemp = Array.new()
p(arraytemp)
arraytemp[120] = 1
p(arraytemp)
arraytemp = Array.new()
p(arraytemp)
arraytemp = Array.new(12)
p(arraytemp)
arraytemp = Array.new(12, 1)
p(arraytemp)

arraytemp = [1, "aa", 11.11, :a]
p(arraytemp)

arraytemp = %w(i am a duck)
p(arraytemp)
arraytemp = %i(you are also a duck)
p(arraytemp)
#-------------------------------------------------------------
#                           数组索引
#-------------------------------------------------------------
puts("------------------Index--------------------")
arraytemp = Array.new(12, 1)

insertTemp = Array.new(5, 211)
arraytemp[3] = 3
arraytemp[3, 0] = insertTemp
p(arraytemp)
arraytemp = [1,2,3,4,5,6,7,8]
temp = arraytemp.values_at(2, 6, 1, 6)
p(temp)

#-------------------------------------------------------------
#                           集合运算
#-------------------------------------------------------------
puts("-------------------Set--------------------")
a = [1,2,3,4,5,6,7,8]
b = [5,6,7,8,9,10]
p(a|b)
p(a&b)
p(a-b)
p(b-a)

#-------------------------------------------------------------
#                           序列和堆栈
#-------------------------------------------------------------
puts("---------------Queue and Stack----------------")
#queue
a = [1,2,3,4,5,6,7]
a.push(8)
p("first #{a.shift()}")
p(a)
#stack
a = [1,2,3,4,5,6,7]
p(a)
a.pop();
a.pop();
a.push(8)
p(a)

#-------------------------------------------------------------
#                           method
#-------------------------------------------------------------
puts("-------------------Method---------------------")
a = [1,3,5,7]
a.concat([2,4,10])
p(a)

a = 1
p(a)
a.freeze
a = [1,2,3]
b = a
b.pop()
a.shift()
p(b)
p(a)

p(a.pop)

a = Array.new(100, nil)
a[22, 0] = Array.new(3, -1)
p(a)
p(a.compact())
puts();puts()
p(a)
p(a.delete(nil))
p(a)
a = [0, 1, 2, 3, 4]
a.delete_at(3)
p(a)


a = [1,2,3,4,5,6,7]
a.reject do |temp|
  temp%2 == 0
end
p(a)
p(b)

a = Array.new(12, 1)
a.concat(Array.new(12, 2))
a.concat(Array.new(12, 3))
p(a)
p(a.uniq())
p(a)
a.uniq!()
p(a)

a.collect! do |item|
   item **= 5
end
p(a)

a.fill(12)-
p(a)
a.fill(11, 2..10)
p(a)

a. fill([1,2,3], 2...6)
p(a)
a.flatten!()
p(a)

a.sort_by! do |temp|
 randTemp = Random.new()
 temp = randTemp.rand(100)
 p(temp)
 -temp
end

p(a)
a.each do |temp|
  p(temp)
end
a.zip do |temp|
  p("zip: #{temp}")
end
