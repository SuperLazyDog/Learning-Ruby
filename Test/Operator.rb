#class and modele test file

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~


#p148
#-------------------------------------------------------------
#                           ???
#-------------------------------------------------------------
p("#{Range.new(1,5)}\n")
p("#{1...5}\n")
p("#{1..5}\n")
p("qwwq".inspect())


class MyOperatorOverride
  attr_reader :lhs, :out
  def initialize(origin: 0)
    @lhs = origin
  end
  #--------------------------------------------
  #               双项运算符重载
  #--------------------------------------------
  def +(rhs)
    return self.class.new(origin: @lhs + rhs)
  end

  #--------------------------------------------
  #               单项运算符重载
  #--------------------------------------------
  def ~()
    return self.class.new(origin: @lhs * @lhs)
  end

  def !@
    return self.class.new(origin: -@lhs)
  end

  def -@
    return self.!@
  end
  #--------------------------------------------
  #                序号重载
  #--------------------------------------------
  def [](index)
    if index == 0
      return @lhs
    else
      return @lhs+index
    end
  end

  def []=(index, value)
    @lhs = (@lhs+index)*value
  end
  #--------------------------------------------
  #               构建文字表达
  #-------------------------------------------
  def inspect
    return "num is #{@lhs}"
  end
end

p(MyOperatorOverride.new(origin: 12))
p(MyOperatorOverride.new(origin: 12) + 234)
p(~MyOperatorOverride.new(origin: 12))
p(!MyOperatorOverride.new(origin: 12))
p(MyOperatorOverride.new(origin: 12)[12])
a = MyOperatorOverride.new(origin: 12)
a[12] = 12
p(a)
