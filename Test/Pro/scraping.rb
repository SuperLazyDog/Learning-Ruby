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


#------------------------------------------------------------------
=begin                      店舗情報の例
#------------------------------------------------------------------
店名：（株）川内自動車　ビックカードーム　タンポポ
写真：ccsrpcma.carsensor.net/shopinfo/images/110/187/012/main.jpg
住所：新潟県新潟市秋葉区朝日７０－１
営業時間：10:00～19:00 
定休日：毎週火曜日定休　年末クリスマス休暇、年始は元旦から営業
<div id="mapbox">
  <noscript>
    このページは JavaScriptを使用しているため、正しく表示が出来ません。<br>申し訳ありませんが、JavaScript対応ブラウザでご利用ください。
  </noscript>
</div>
=end
#------------------------------------------------------------------
=begin
  def self.get_store(page, car)
    link = page.at('body > div.page > div:nth-child(8) > div > div.column__sub > div.sideBoxWrap--primary > div.sideBoxWrap__contents > div.shopInfo > h3 > a')
    store_page = agent.get(link[:href])
    return unless store_page #store_pageが存在していない場合、処理しない
    #-------------------------------------
    #　　　　　　　　　　店名
    #-------------------------------------
    store_name = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/h2')
    #-------------------------------------
    #　　　　　　　　　　写真
    #-------------------------------------
    store_image = store_page.at('/html/body/div[1]/div[3]/aside/div/div[1]/a/img')
    store_image_link = store_image[:src]
    store_image_link[0..1] = ""
    #-------------------------------------
    #　　　　　　　　　　住所
    #-------------------------------------
    store_adress = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[2]').inner_text
    length = store_adress.length
    store_adress[length-3..length-1] = ''
    #-------------------------------------
    #　　　　　　　　　営業時間
    #-------------------------------------
    store_business_hours = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[3]').inner_text
    #-------------------------------------
    #　　　　　　　　　定休日
    #-------------------------------------
    store_regular_holiday = store_page.at('/html/body/div[1]/div[3]/aside/div/div[2]/section/dl/dd[4]').inner_text
    #-------------------------------------
    #　　　　　　　　　　地図
    #-------------------------------------
    #地図情報が取っているんだが、使えないため、住所からgoogle map apiを使って生成すること
    store_access_map_link = store_page.at('/html/body/div[1]/div[4]/div/div/p[2]/a')[:href]
    return unless store_page#mapのリンクが存在していない場合、処理しない
    store_access_map_page = agent.get(store_access_map_link)
    store_access_map = store_access_map_page.at('#mapbox')
    #----------------------------------------------------------
    #　　　　　　　　　　   データベースに保存
    #----------------------------------------------------------
    store = car.condition || car.build_condition
    store.name            = store_name
    store.image_link      = store_image_link
    store.adress          = store_adress
    store.business_hours  = store_business_hours
    store.regular_holiday = store_regular_holiday
    store.access_map_link = store_access_map
    store.save!
  end

=end
