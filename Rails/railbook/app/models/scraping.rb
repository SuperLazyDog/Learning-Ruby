require 'mechanize'

agent = Mechanize.new
page = agent.get('https://www.baidu.com')
elements = page.search('p')
