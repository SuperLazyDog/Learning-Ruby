#method test file
puts("----------------------------------------")
puts("              first def")
def myFirst()
  puts("thank you")
end
myFirst()

puts("----------------------------------------")
puts("               with arg")
def myLoop(yourNum = 5)
  puts("yourNum: #{yourNum}")
 puts("will start your closure")
 yield
 puts("end your closure successfully")
end
myLoop(12) do
  5.times do
    puts("tesing")
  end
end

puts("----------------------------------------")
puts("          argArray and label")
def myArgsAndLabel(first: 0, second: 0)
  puts("#{first} + #{second} = #{first+second}")
end
myArgsAndLabel(first: 6, second: 12)

def args(a, *args, c)
  puts("a: #{a}")
  print(args)
  puts("")
  puts("c: #{c}")
end
args(19, 12,32,4)

def convert(origin, to: 0)
  origin = to
  puts("origin: #{origin}")
  puts("to #{to}")
end
convert(15, to: 2)

puts("----------------------------------------")
puts("             use hash")
def hashTest(a)
  puts(a)
end
#hash = {a: 1, b: 2}
hash = {:first=>"✌️ 😳 ✌️ ", :second=>"😳 😂 😳 "}
hashTest(hash)
