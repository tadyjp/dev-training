require 'net/http'
require 'nokogiri'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# HTMLを解析
doc = Nokogiri::HTML.parse(res.body)

puts doc.css('h1 img').attr('src')
