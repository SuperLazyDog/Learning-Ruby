#class and modele test file

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~


#-------------------------------------------------------------
#                           测试一
#-------------------------------------------------------------
class MyFirst
  #------------------------------------------
  #                内部属性
  #------------------------------------------
  @@count = 0
  @num
  @isChanged
  Version = 1.0
  attr_reader :localTest
  attr_reader :a
  attr_writer :b
  attr_accessor :c
  #access test
  #attr_accessor all? { |e|  }
  #------------------------------------------
  #               初始化函数
  #------------------------------------------
  def initialize(num = 0)
    @num = num
    @isChanged = false
    @a, @b, @c = [1, 2, 3]
    @localTest = "thanks"
  end
  #------------------------------------------
  #                  方法
  #------------------------------------------
  #----------------------
  #       实例方法
  #----------------------
  def putsNum()
    if @isChanged == false
      puts("default num: #{@num}")
    else
      puts("num has been changed: #{@num}")
    end
  end
  #改变内部属性
  def setNum(value: 0)
    @@count += 1
    @num = value
    @isChanged = true
  end
  def setNumTest(value: 0)
    self.setNum(value: value)
    #@value = value
  end
  #获取内部属性
  def getNum()
    return @num
  end
  def getCount()
    return @@count
  end
  #----------------------
  #       静态方法
  #----------------------
  class << MyFirst
    def staticPutsHello()
      puts("this is a static method test, thanks")
    end
  end
  def self.getCount()
    return @@count
  end
end

def MyFirst.secondHelloStaticTest()
  puts("hello, thanks for your patient")
end
puts("----------------------------------------")
puts("             first test")
firstInstance = MyFirst.new(5)
firstInstance.putsNum()
puts("the num is #{firstInstance.getNum()}")
firstInstance.setNum(value: 12)
firstInstance.putsNum()
firstInstance.b = 5
firstInstance.c = 213
puts("c: #{firstInstance.c}")
puts(firstInstance.localTest)
puts("set my Value again")
firstInstance.setNumTest(value: 888)
firstInstance.putsNum();
puts("----------------------------------------")
puts("            class method test")
MyFirst.staticPutsHello()
MyFirst.secondHelloStaticTest()
puts("Version: #{MyFirst::Version}")
print("use instance method to get count: ")
puts(firstInstance.getCount)
print("use class method to get count: ")
puts(MyFirst.getCount())
puts("----------------------------------------")
puts("            access test")
#-------------------------------------------------------------
#                           测试二
#-------------------------------------------------------------
class MySecond
  #------------------------------------------
  #                内部属性
  #------------------------------------------
  #----------------------
  #       静态属性
  #----------------------
  @@staticProperty = 0
  #----------------------
  #       实例属性
  #----------------------
  attr_reader :readerTest
  attr_writer :writerTest
  attr_accessor :accessorTest
  attr_reader :hashTest
  #------------------------------------------
  #               初始化函数
  #------------------------------------------
  def initialize
    @hashTest = {:a => 1, :b => 2}
    @readerTest = @writerTest = @accessorTest = 1
    print("readerTest: #{@readerTest}, writerTest: #{@writerTest}, accessorTest: #{@accessorTest}\n")
  end
  #------------------------------------------
  #                  方法
  #------------------------------------------
  #----------------------
  #       实例方法
  #----------------------
  def helloFunc()
    print("hello\n")
    @@staticProperty += 1
  end

  #----------------------
  #       静态方法
  #----------------------
  def MySecond.staticProperty()
    return @@staticProperty
  end
end

secondInstance = MySecond.new()
puts("----------------------------------------")
print("out readerTest: #{secondInstance.readerTest}\n")
#print("out writerTest: #{secondInstance.writerTest}\n")
print("out accessorTest: #{secondInstance.accessorTest}\n")
secondInstance.helloFunc()
secondInstance.helloFunc()
print(MySecond.staticProperty)
puts("")

#------------------------------------------
#               extention
#------------------------------------------
class MySecond
  def extentionTest(value: "OK")
    puts(value)
  end
end
secondInstance.extentionTest(value: "thanks")
puts("hashTest: #{secondInstance.hashTest}")

#------------------------------------------
#               inheritance
#------------------------------------------
class MyThree < MyFirst
  def initialize(value)
    super(value)
  end

  def inheritanceTest(value)
    puts(value)
  end
end

inheritanceTest = MyThree.new(54)
inheritanceTest.inheritanceTest(10)
inheritanceTest.putsNum()
inheritanceTest.setNum(value: 108)
inheritanceTest.putsNum()

#-------------------------------------------------------------
#                           测试三
#-------------------------------------------------------------
module SayHello
  a = 5
  @b = 6
  C = 11
  def thanks()
    puts("thanks")
  end
  def getResult()
    @b = 7
    return @b
  end
end

class MyThird
  include SayHello
  def initialize
    @c = SayHello::C
    puts("@c = #{@c}")
  end
end

thirdInstance = MyThird.new()
puts("a = #{thirdInstance.getResult()}")
puts(MyThird.include?(SayHello))
print(MyThird.ancestors());puts()
puts(MyThird.superclass())

module SingletonTest
  def output()
    puts("this is singletonTest")
  end
end

MyThird.extend(SingletonTest)
MyThird.output()
