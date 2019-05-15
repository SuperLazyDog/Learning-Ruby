class Hello
  attr_accessor :a, :b, :c

  def initialize
    @a = 100
    @var_test = 100
  end
  def sayHello
    puts "hello"
  end
end

a = Hello.new
a.sayHello
puts "a: #{a.a} b: #{a.b} c: #{a.c}"
puts "@var_test: #{@var_test}"
