require_relative "LibraryTest"

myTest()

myDic = {a: 1, b: 2, c: 3}
print(myDic[:a])
puts()


a, b, *c = 1, 2, 3,4,5,6,7
puts("a = #{a}")
puts("b = #{b}")
puts("c = #{c}")

a, b = b, a
p([a, b])
NUMARRAY = [a, b]
d, e = NUMARRAY
print("d = #{d}, e = #{e}\n")
f,  = NUMARRAY
print("f = #{f}\n")
