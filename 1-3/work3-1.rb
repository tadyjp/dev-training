require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される

get '/work/3-1' do

  html = '<h1>ニュース</h1>' # 出力する文字を貯める変数

  open('output3-3.txt', 'r') do |file|
    file.each do |line| # CSVファイルは複数行あるので、1行ずつ処理

      text, url = line.split(',')

      html << "<a href='http://www.yahoo.co.jp/#{url}'>#{text}</a><br>"
    end
  end

  return html # return したものがブラウザに表示される
end
