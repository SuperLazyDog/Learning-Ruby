require 'mechanize'

def get_url(i)
  "https://eow.alc.co.jp/svl_level#{i}.html"
end

def row(i, word)
  "#{i}, #{word}\n"
end

agent = Mechanize.new
f = File.new("word.csv", 'w')
f.puts("level, word")
(1..12).each do |i|
  url = get_url i
  page = agent.get url
  words_list = page.search 'ul.words'
  words_list.each do |list|
    list.search("a").each do |word|
      data = word.inner_text
      f.puts row(i, data) unless data.empty?
    end
  end
end
f.close
