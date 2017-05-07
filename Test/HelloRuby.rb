print("Hello, Ruby.\n")
puts("Hello, Ruby.")
p("Hello Ruby.\n")
print(1+1, "\n")
print(2+2, "\n")
#20
intX = 10
intY = 20
intZ = 30
volume = intX*intY*intZ
area = (intX*intY + intY*intZ + intZ+intX) * 2
print("面積：#{area}\n", "体積： #{volume}\n")
#24
print(intX == intY, "\n")
print(intX > intY, "\n")
print(intX < intY, "\n")
a = 20
if a > 50 then#if
  print("a = #{a} > 50\n")
else
  print("a = #{a} <= 50\n")
end

while a <= 50
  print("a = #{a}\n")
  a += 1
end

print("a > 50, a = #{a}\n")

times = 100
count = 1
times.times do
  print("I like Ruby, time = #{count}\n")
  count += 1
end

10.times do
  print("just a test\n")
end

nameArray = ["one", "two", "three", "four"]
print("name: ", nameArray[1], "\n")
nameArray[3] = 1224#Rubyの配列にはどんなものも入れられる
print("nameArray[3] = #{nameArray[3]}\n")
print("nameArray's size = #{nameArray.size}\n")
nameArray.each do |str|
  print(str, "\n")
end
"eachChar".each_char { |chr|
  print(chr, "\n")}

sym = :test
print(sym.to_s())
#myHash = {:a => 1, :b => 2, :c => 3}
myHash = {ab: "1", ba: "2"}
print(myHash[:ab], "\n")
/hello/ =~ "hello, Ruby"
/Ruby/ =~ "hello, Ruby"
print(/Ruby/, "\n")
print(/hello/, "\n")

puts("first: #{ARGV[0]}")
puts("second #{ARGV[1]}")
