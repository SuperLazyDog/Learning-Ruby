#Encoding Class Test

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00:47
#2017/05/19    01:50:~03:35
#2017/05/19    10.10~13：05 p248
#2017/05/19    14.33~18:40
#2017/05/20    10:38~13:27
#              17:28~20:03
#2017/05/21    11:02~14:27
#              18：15~19:33


#2017/05/22    00:05~00:50
#2017/05/22    01:57~02:40
#p223 誤字　少数
#p230 誤値

#-------------------------------------------------------------
#                         library
#-------------------------------------------------------------
def mkTimeSafely(y=0, m=1, d=0, h=0, min=0, s=0, us=0)
  isLeapYear = ((y%4 == 0) && (y % 100 != 0))|(y%400 == 0)
  puts(isLeapYear)
  m = (m%12)==0 ? 12:(m%12)
  if m == 2
    if isLeapYear
      d = (d%29) == 0 ? 29:(d%29)
    else
      d = (d%28) == 0 ? 28:(d%28)
    end
  else
    if (m = 1| m = 3| m = 5)
      d = (d%31) == 0 ? 31:(d%31)
    else
      d = (d%30) == 0 ? 30:(d%30)
    end
  end
  h = (h%24) == 0 ? 24:(h%24)
  min = (min%60) == 0 ? 60:(min%60)
  s = (s%60) == 0? 60:(s%60)
  us = us%1000000
  return Time.mktime(y, m, d, h, min, s, us)
#4的倍数且不是100的倍数
#400的倍数是闰年
end
#-------------------------------------------------------------
#                            Time
#-------------------------------------------------------------
puts("---------------------------------------")
puts("             Create Time")
puts("---------------------------------------")
count = 1.0
print("count: #{count}   ")
time = Time.new()
puts(time, time.year, time.month, time.day, time.hour, time.min, time.sec, time.wday, time.mday, time.yday,time.zone)

puts("----------------------")
count = 1.1
print("count: #{count}   ")
time = Time.mktime(2017)
puts(time)

puts("----------------------")
count = 1.2
print("count: #{count}   ")
time = Time.mktime(2012, 2, 30, 0, 0, 0, 999999)
puts(time)


puts("----------------------")
count = 1.3
print("count: #{count}   ")
#time = mkTimeSafely(2534534121, 215345343, 4423423423423124, 34235643245, 126456454, 144423412, 1468749120312234)
#puts(time)


puts("----------------------")
count = 1.4
print("count: #{count}   ")
time = Time.at(1131213131)
puts(time)

puts("----------------------")
count = 1.5
print("count: #{count}   ")
time = Time.new()
time += 60*60*24*30
puts(time.to_s)
puts(time.strftime("%c"))

puts("---------------------------------------")
puts("             Time Format")
puts("---------------------------------------")
require "time"
puts("----------------------")
time = Time.new()
puts(time.rfc2822())
puts(time.iso8601())
