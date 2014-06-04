require 'net/http'
require 'nokogiri'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# HTMLを解析
doc = Nokogiri::HTML.parse(res.body)

open('output3-3.txt', 'w') do |file|

  doc.css('#topicsboxbd ul.emphasis a').each { |a_tag|
    file.write "#{a_tag.text},#{a_tag.attr('href')}\n" # 最後に改行が必要
  }

end

