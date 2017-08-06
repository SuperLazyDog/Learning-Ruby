#----------------------------------------------
#                拉取数据
#----------------------------------------------
require 'mechanize'

agent = Mechanize.new
agent.user_agent_alias = 'Mac Firefox'
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

puts('----------------------------------------------')
puts('                  测试 ')
puts('----------------------------------------------')
=begin
・店名 store_name
・写真 store_image_link
・住所 store_adress
・営業時間 store_business_hours
・定休日 store_regular_holiday
・地図 store_access_map_link
=end

agent = Mechanize.new
page = agent.get('http://www.carsensor.net/usedcar/detail/CU5888240238/index.html?TRCD=200002')
#block = page.search('/html/body/div[1]/div[4]/div/div[2]/div[1]')
#puts block
link = page.at('body > div.page > div:nth-child(8) > div > div.column__sub > div.sideBoxWrap--primary > div.sideBoxWrap__contents > div.shopInfo > h3 > a')
puts link
puts link[:href]
store_page = agent.get(link[:href])
puts store_page.body
#・店名
store_name = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/h2')
puts '店名：' << store_name
#・写真
store_image = store_page.at('/html/body/div[1]/div[3]/aside/div/div[1]/a/img')
store_image_link = store_image[:src]
store_image_link[0..1] = ""
#puts store_image[:src]
puts '写真：' << store_image_link
#・住所
store_adress = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[2]').inner_text
length = store_adress.length
store_adress[length-3..length-1] = ''
puts '住所：' << store_adress
#・営業時間
store_business_hours = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[3]').inner_text
puts '営業時間：' << store_business_hours
#・定休日
store_regular_holiday = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[4]').inner_text
puts '定休日：' << store_regular_holiday
#・地図
=begin
<div id="mapbox">
  <noscript>このページは JavaScriptを使用しているため、正しく表示が出来ません。<br>申し訳ありませんが、JavaScript対応ブラウザでご利用ください。</noscript>
</div>
=end
store_access_map_link = store_page.at('/html/body/div[1]/div[4]/div/div/p[2]/a')[:href]
store_access_map_page = agent.get(store_access_map_link)
store_access_map = store_access_map_page.at('#mapbox')
puts store_access_map
