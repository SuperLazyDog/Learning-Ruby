#----------------------------------------------
#                 测试常量
#----------------------------------------------

class ConstTest
  TEST = []
end

puts %Q(ConstTest::TEST = #{ConstTest::TEST})

ConstTest::TEST.push(123)
ConstTest::TEST.push(123)
ConstTest::TEST.push(123)
ConstTest::TEST.push(123)


puts %Q(ConstTest::TEST = #{ConstTest::TEST})
