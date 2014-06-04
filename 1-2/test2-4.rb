require 'net/http'
require 'nokogiri'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# HTMLを解析
doc = Nokogiri::HTML.parse(res.body)

# cssの「#topicsboxbd ul.emphasis a」に対して繰り返す 
doc.css('#topicsboxbd ul.emphasis a').each { |a_tag|

  # 上で取得した「aタグ」それぞれに対して中身を表示する
  puts a_tag.text
}
