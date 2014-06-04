require 'net/http'

res = Net::HTTP.start('www.yahoo.co.jp') {|http|
  http.get('/')
}

puts res.body
