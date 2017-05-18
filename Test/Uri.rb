#class and modele test file

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~


#p148

require "net/http"
require "uri"
#-------------------------------------------------------------
#                           测试一
#-------------------------------------------------------------
url = URI.parse("http://blog.sina.com.cn/s/blog_dcb875d90102y51l.html")
http = Net::HTTP.start(url.host, url.port)
doc = http.get(url.path)
puts(doc.body)



a = nil
b = nil
c =  a || b
p(c)
for count in 0..9
  puts("test value: #{count>5?">":"<"}")
end
