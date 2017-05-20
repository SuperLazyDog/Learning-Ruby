#String Class Test

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00：47
#2017/05/19    01:50:~03:35
#2017/05/19    10.10~13：05 p248
#2017/05/19    14.33~
#2017/05/20    10:38~

#p223 誤字　少数
#p230 誤値

MATCHED = "matched"
DISMATCHED = "dismatched"
#-------------------------------------------------------------
#                       Create Regexp
#-------------------------------------------------------------
puts("---------------------------------------")
puts("           Create Regexp")
puts("---------------------------------------")
a = /ABC/
b = /123/

#-------------------------------------------------------------
#                         Matching
#-------------------------------------------------------------
puts("---------------------------------------")
puts("              Matching")
puts("---------------------------------------")
count = 0
print("count: #{count}   ")
if /ABC/ =~ "sakjhABCsadhkj"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 1
print("count: #{count}   ")
if /^ABC$/ =~ "ABCA"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 2
print("count: #{count}   ")
if /^ABC/ =~ "salkjaskjdh\nABCA"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 3
print("count: #{count}   ")
if /ABC$/ =~ "sadafdasnasv\nABC"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

#[...] [^...]
count = 4
print("count: #{count}   ")
if /[ABC]\Z/ =~ "sadafdasnasv\nABCD\n"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 5
print("count: #{count}   ")
if /^[^0-9]../ =~ "KAK"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 6
print("count: #{count}   ")
if /^[^0-9]\s\s\s\s\s\s../ =~ "K      AAK"
  puts(MATCHED)
else
  puts(DISMATCHED)
end


count = 7
print("count: #{count}   ")
if /[a-zA-Z]\^[0-9]+[a-zA-Z]\^[0-9]/ =~ "x^2+y^3 = 1"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

#repeat
count = 8
print("count: #{count}   ")
if /^[0-9a-zA-Z]+\^?[0-9a-zA-Z]*\s*[\+\-\*\/]\s*[0-9a-zA-Z]+\^?[0-9a-zA-Z]*\s*[\+\-\*\/\=]\s*[0-9a-zA-Z]+/ =~ "21311231^12    + 21^2 = 1"
  puts(MATCHED)
else
  puts(DISMATCHED)
end

count = 8.1
print("count: #{count}   ")
if /^[0-9a-zA-Z]+\^?[0-9a-zA-Z]*\s*[\+\-\*\/]\s(\s*[0-9a-zA-Z]+\^?[0-9a-zA-Z]*\s*)\s*[\+\-\*\/\=]\s*[0-9a-zA-Z]+/ =~ "8x^21 + 3x^3 +2x^2-x = 2"
  puts(MATCHED)
else
  puts(DISMATCHED)
end
