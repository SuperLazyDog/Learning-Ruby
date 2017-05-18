#Exception

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00：47
#2017/05/19    01:50:~03:35

#-------------------------------------------------------------
#                           测试一
#-------------------------------------------------------------
class MyFirst
  @arrayTemp
  def initialize(numArray)
    @arrayTemp = numArray
  end
#--------------------------------------
#               展示数组
#--------------------------------------
  def showAll()
    count = 0
    @arrayTemp.each do |temp|
      print("#{count}: #{temp}\n")
      count += 1
    end
  end
  def showAllUseForloop()
    count = 0
    for temp in @arrayTemp
      print("#{count}: #{temp}\n")
      count += 1
    end
  end
  #--------------------------------------
  #               展示词典
  #--------------------------------------
  #each方法
  def showDic(isGetHash)
    index = isGetHash ? 0:1
    count = 0
    for temp in @arrayTemp
      print("#{count}: #{temp[index]}\n")
      count += 1;
    end
    count = 0
  end
#swift方式
  def showDicInOtherWay(isGetHash)
    index = isGetHash ? 0:1
    count = 0
    puts("showDicInOtherWay")
    for fst, sed in @arrayTemp
      print("#{fst}: #{sed}\n")
      count += 1;
    end
    count = 0
  end
end

#array
firstInstance = MyFirst.new([1,2,3,4,5,6])
firstInstance.showAll()
firstInstance.showAllUseForloop()
#hash
firstInstance = MyFirst.new({a: 1, b: 2, c: 3})
firstInstance.showAll()
puts("----------词典[0]-----------")
firstInstance.showDic(true)
puts("----------词典[1]------------")
firstInstance.showDic(false)
firstInstance.showDicInOtherWay(true)


#-------------------------------------------------------------
#                         嵌入代码块
#-------------------------------------------------------------
#--------------------------------------
#                嵌入
#--------------------------------------
def embedBlockTest(str)
  puts("you str: #{str}")
  yield
  puts("over")
end

embedBlockTest("started") do
  count = 0
  while count < 5
    print("#{count} ")
    count += 1
  end
  puts()
end
puts("-----------------------------------")
#--------------------------------------
#            检验是否有代码块
#--------------------------------------
def embedBlockTestSed(str)
  puts("you str: #{str}")
  if block_given?
    yield
  else
    puts("no block given")
  end
  puts("over")
end

embedBlockTestSed("start with no block")
puts("")
embedBlockTestSed("start with block") do
  puts("just a test")
end
puts("-----------------------------------")
#--------------------------------------
#                带参数
#--------------------------------------
def embedBlockTestTrd(str)
  puts("you str: #{str}")
  if block_given?
    yield(1,2,3,4,5)
  else
    puts("no block given")
  end
  puts("over")
end
embedBlockTestSed("start with argument block") do |a, b, c, d, e|
  #f = Integer(a) + Integer(b) + Integer(c) + Integer(d) + Integer(e)
  #puts("#{a} + #{b} + #{c} + #{d} + #{e} = #{f}")
end
puts("-----------------------------------")
#--------------------------------------
#                排列
#--------------------------------------
def sortMethod(a, b)
  return a <=> b
end

def getArrayLength(array)
  return array.length
end


#array.sort() do ... end
array = [123, 4312, 543, 6354, 12, 534, 65423, 423]
print(array.sort() {|a, b| sortMethod(a, b)})
puts(""); puts("")

#array.sort_by() do ... end
print(array.sort_by() {|a| -a})
puts(); puts()

for temp in 995.upto(1000)
  puts(temp)
end
#--------------------------------------
#             redo test
#--------------------------------------
#result: redo返回时候一切回到进入redo的那次循环最开始
hasRedo = false
for num in 1..10
  if hasRedo
    print("redo, num: #{num}\n")
    num += 1
    hasRedo = false
  end
  if num == 5
    print("num = 5, redo\n")
    hasRedo = true
    redo
  end
end

#--------------------------------------
#             代码块类
#--------------------------------------
sayHello = Proc.new() do |name|
  puts("Proc Test, Thank you #{name}")
end

sayHello.call("Xu Weida")

def sample(a, b, &method)
  if method
    method.call("Xu Weida")
    puts("#{a} + #{b} = #{a+b}")
  else
    puts("no block")
  end
end
#直接定义代码块
sample(1, 2) do |name|
  puts("testing, #{name}")
end
puts(); puts()

#直接带入现成代码块
begin
  sample(3, 4, &sayHello)
rescue => exception
  p(exception.class)
  p(exception.message)
  p(exception.backtrace)
end

#--------------------------------------
#            本地量与代码块量
#--------------------------------------
x = 0
y = 0

for x in 0...10
  y = x
end
puts("x = #{x}, y = #{y}")

x = 0; y = 0
[1,2,3,4,5].each do |x|
  y = x
end
puts("x = #{x}, y = #{y}")

x = y = z = 0
ary = [1, 2, 3]
3.times do
  puts("y = #{y}")
  ary.each do |x, y|
    y = x
    z = x
    print(x, y, z)
    puts()
  end
end
p(x, y, z)
puts()
