#Exception

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50

#-------------------------------------------------------------
#                           测试一
#-------------------------------------------------------------

class ExceptionTest
  @testNum

  def initialize(value)
    @testNum = value
  end
  #--------------------------------------------
  #               构建文字表达
  #-------------------------------------------
  def inspect()
    return "#{@testNum}"
  end

end

begin
  sample = ExceptionTest.new(value: 12)
  raise "对不起，这是个error😂 😳 😂 "
rescue => exception
  p(exception.class)
  p(exception.message)
  p(exception.backtrace)
  sleep 2
  #retry
ensure
  p("thanks, it's over")
end
a = Integer("abc") rescue 123
p(a)

raise "对不起，这是个error😂 😳 😂 "
