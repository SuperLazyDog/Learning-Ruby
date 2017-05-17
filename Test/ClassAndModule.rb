#class and modele test file
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
  #------------------------------------------
  #               初始化函数
  #------------------------------------------
  def initialize
    @readerTest = @writerTest = @accessorTest = 1
    print("readerTest: #{@readerTest}, writerTest: #{@writerTest}, accessorTest: #{@accessorTest}\n")
  end
  #------------------------------------------
  #                  方法
  #------------------------------------------
  #----------------------
  #       实例方法
  #----------------------
  private :helloFunc
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
