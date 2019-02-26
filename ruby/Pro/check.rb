#----------------------------------------------
#              测试各种检验类方法
#----------------------------------------------

puts("----------------------------------------")
puts("                  1.1")
puts("----------------------------------------")
asa = nil
asa = [1,2]
puts("asa#{asa}")
print("defined?: ", defined? asa);puts()
print("nil?: ", asa.nil?);puts()
print("empty?: ", asa.empty?);puts()
#print("blank?: ");print(asa.blank?);puts() //Rails 可用
#print("presence?: ");print(asa.presence?);puts() //Rails 可用
puts("----------------------------------------")
puts("                  1.2")
puts("----------------------------------------")
local = 1
Const = 1
$global = 1
@instance = 1
@@class = 1
print("local: ", defined?(local));puts()
print("Const: ", defined?(Const));puts()
print("$global: ", defined?($global));puts()
print("@instance: ", defined?(@instance));puts()
print("@@class: ", defined?(@@class));puts()

puts("----------------------------------------")
puts("                  1.3")
puts("----------------------------------------")
sample = []
print("isArray: ", sample.instance_of?(Array));puts();
print("class: ", sample.class);puts();

puts("----------------------------------------")
puts("                  1.4")
puts("----------------------------------------")
#2017/06/16
#class, instance_of?
class Test
  @a
  def initialize(num = 0)
    @a = num
  end

  def myFunc()
    puts(@a)
  end
end
sample = Test.new
p(sample.class)
p(sample.class.instance_of?(String))
p(sample.class.instance_of?(Test))
p(sample.class == Test)

puts("----------------------------------------")
puts("                  1.5")
puts("----------------------------------------")
#2017/06/23
#include?
puts("array test: ")
temp = [1,2,3,5]
print(temp);puts();
for i in 1...5
  if temp.include?(i)
    printf("temp include %d\n", i)
  else
    #printf("temp has no member of %d\n", i)
    puts("temp has no member of #{i}")
  end
end

puts("------------")
puts("hash test: ")
temp = {:a => 1, :b => 2, :c => 3, :d => 5}
temp1 = {x: 1, b: 2, c: 5, d: 7}
temp1.each_key do |item|
  if temp.include?(item)
    printf("temp include %s", item.inspect);puts();
  else
    puts("temp has no member of #{item}")
  end
end

puts("----------------------------------------")
puts("                  1.6")
puts("----------------------------------------")
#2017/06/24
#f.write
STDOUT.write("write test\n")
STDOUT.write("successfully!!!😊 \n\n")
STDOUT.write("😂 😳 😂 \n")
str = ""
while str!= "quit\n"
  str = STDIN.gets
  puts("your str is :#{str}")
end

puts("over")
