require 'mechanize'
class Scraping
  def test
    agent = Mechanize.new
    page = agent.get('https://www.baidu.com')
    elements = page.search('p')
  end
end
