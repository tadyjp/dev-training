require 'net/http'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# 一旦「ニュース」の中身だけ取得します
res.body =~ /<div id="topicsfb"(.+?)<div id="economyfb"/m
yahoo_topic = $1

# <a[^>]+>([^<]+)< がaタグの中身を取得します
yahoo_topic =~ /<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?<a[^>]+>([^<]+)<.+?/
puts $1
puts $2
puts $3
puts $4
puts $5
puts $6
puts $7
puts $8

