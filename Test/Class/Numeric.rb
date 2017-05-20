#Num

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00：47
#2017/05/19    01:50:~03:35
#2017/05/19    10.10~

#p223 誤字　少数
#230  誤値
require "uuid"
#-------------------------------------------------------------
#                           测试一
#-------------------------------------------------------------
p(2**10)
#p(2**1000)

#rational
p((Rational(12, 18) + Rational(123, 321)))
rat = Rational(21, 3134).to_f()
p(rat)
rat = Rational(1, 2)
puts("the numerator: #{rat.numerator()}\nthe denominator: #{rat.denominator()}\n")

#Complex
cmp = Complex(1, 12)
p(cmp)
puts("the real: #{cmp.real()}\nthe imaginary: #{cmp.imaginary()}")

#literal
begin
  a = 123
rescue => ex
  p(ex.class)
  p(ex.message)
  p(ex.backtrace)
end
puts("------------operator method----------------")
puts(a)
a = 12340
if a.div(4) == a%4
  puts("equal")
else
  print("a.div(4): #{a.div(4)}   a%d: #{a%4}\n")
end


if a.quo(4) == a%4
  puts("equal")
else
  print("a.quo(4): #{a.quo(4)} a%d: #{a%4}\n")
end


if a.modulo(4) == a%4
  puts("equal")
else
  print("a.modulo(4): #{a.modulo(4)} a%d: #{a%4}\n")
end

p((-123).modulo(2))
p((-123).remainder(2))

p(11.quo(2))
p(-1.modulo(2))
p(-1.remainder(2))
p(-1.divmod(2))
p(123.to_s())
p(Math.gamma(123))
p(Math.exp(2))



puts("----------------convert------------------")
p(123.to_f())
p(321.123.to_i)
p(123.123_123_123_123.round(1))
p(125.12.round(-1))
p(1.4.ceil)
p(1.4.floor)
printf("0b11111111 & 0b10000001: %b\n", 0b11111111 & 0b10000001)
printf("%d & %d: %d\n", 0b11010001, 0b10001111, 0b11010001 & 0b10001111)
printf("%d | %d: %d\n", 0b10100000, 0b10001111,0b10100000 | 0b10001111)
printf("0b11111111 >> 3: %b\n", 0b11111111 >> 3)
printf("0b11111111 << 3  %b\n", 0b11111111 << 3)


puts("----------------random------------------")
r1 = Random.new()
p(r1.rand(100))
p(r1.rand(100))
p(r1.rand(100))
p(r1.rand(100))
r2 = Random.new()
p(r2.rand(100))
p(r2.rand(100))
p(r2.rand(100))
p(r2.rand(100))
require "securerandom"

p(SecureRandom.random_bytes(32))
p(SecureRandom.base64(32))

puts("-------------------UUID--------------------")
uuid = UUID.new()
10.times do
  p(uuid.generate)
end

puts("-------------------Loop--------------------")
#times
5.times() do |count|
  puts("#{count}: test")
end
puts(); puts()

#upto
5.upto(10) do |count|
  puts("#{count}: upto test")
end
puts();puts()

#downto
10.downto(5) do |count|
  puts("#{count}: downto test")
end


#step
10.step(100, 5) do |count|
  puts("#{count}: step test")
end


puts("-------------------UUID--------------------")
uuid = UUID.new()
10.times do
  p(uuid.generate)
end
puts("-------------------UUID--------------------")
uuid = UUID.new()
10.times do
  p(uuid.generate)
end
puts("-------------------UUID--------------------")
uuid = UUID.new()
10.times do
  p(uuid.generate)
end
