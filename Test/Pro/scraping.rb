#----------------------------------------------
#                拉取数据
#----------------------------------------------
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://localhost:3000/scraping_test/t1')
#page = agent.get('http://blog.sina.com.cn/s/blog_dcb875d90102y2tb.html')
#age = agent.get('https://www.baidu.com')
puts('----------------------------------------------')
puts('                   body')
puts('----------------------------------------------')
puts page.body
puts('----------------------------------------------')
puts('                    p')
puts('----------------------------------------------')
elements = page.search('p')
puts elements

puts('----------------------------------------------')
puts('                   复杂获取')
puts('----------------------------------------------')
elements = page.search('.table .table-data-1 p')
puts elements

puts('----------------------------------------------')
puts('                  去除标签')
puts('----------------------------------------------')
for ele in elements
  puts ele.inner_text
end

puts('----------------------------------------------')
puts('                字符加工，首尾加上😱 ')
puts('----------------------------------------------')
for ele in elements
  text = ele.inner_text
  text << '😱 '
  text = '😱 ' << text
  puts text
end
