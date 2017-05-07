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
