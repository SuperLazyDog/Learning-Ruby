#class and modele test file
class MyFirst
  #------------------------------------------
  #                内部属性
  #------------------------------------------
  @num
  @isChanged
  attr_reader :localTest
  attr_reader :a
  attr_writer :b
  attr_accessor :c
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
  def putsNum()
    if @isChanged == false
      puts("default num: #{@num}")
    else
      puts("num has been changed: #{@num}")
    end
  end
  #改变内部属性
  def setNum(value: 0)
    @num = value
    @isChanged = true
  end
  #获取内部属性
  def getNum()
    return @num
  end
end

firstInstance = MyFirst.new(5)
firstInstance.putsNum()
puts("the num is #{firstInstance.getNum()}")
firstInstance.setNum(value: 12)
firstInstance.putsNum()
firstInstance.b = 5
firstInstance.c = 213
puts("c: #{firstInstance.c}")
puts(firstInstance.localTest)
