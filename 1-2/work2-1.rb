require 'net/http'

USER_AGENT = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/', 'User-Agent' => USER_AGENT)
}

# ヒント: http://rubular.com/r/mYqzqlscMi
res.body =~ /<h1><a href=r\/mlg><img src="(.+?)"/

puts $1

