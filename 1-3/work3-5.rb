require 'sinatra'
require 'sinatra/reloader' # この行を書くと、再起動無しにファイルの変更が反映される
require 'sqlite3'

get '/work/3-5' do

  db = SQLite3::Database.new('work3-3.db')

  # SQLの結果をハッシュ形式で取得
  db.results_as_hash = true

  html = '<h1>ニュース</h1>' # 出力する文字を貯める変数

  db.execute('SELECT * FROM work3_3;') do |row|
    html << "<a href='http://www.yahoo.co.jp/#{row['url']}'>#{row['title']}</a><br>"
  end

  return html # return したものがブラウザに表示される
end

get '/work/3-5/:id' do

  db = SQLite3::Database.new('work3-3.db')

  # SQLの結果をハッシュ形式で取得
  db.results_as_hash = true

  title = ''

  db.execute('SELECT * FROM work3_3 WHERE rowid = ?;', params[:id]) do |row|
    html << "<a href='http://www.yahoo.co.jp/#{row['url']}'>#{row['title']}</a><br>"
  end

  html = "<h1></h1>"


  return html # return したものがブラウザに表示される
end

