require 'sqlite3'

# 「test3-5.db」というファイル名のデータベースベースを作る
db = SQLite3::Database.new('test3-5.db')

# データベースを作成
rows = db.execute('CREATE TABLE IF NOT EXISTS books (title varchar(30), price int);')

# データを追加する
db.execute 'INSERT INTO books values ( ?, ? );', ['絵本', 480]
db.execute 'INSERT INTO books values ( ?, ? );', ['辞書', 3200]

# データベースからデータをすべて取り出す
puts 'select all'
db.execute('SELECT * FROM books;') do |row|
  p row
end

# データベースからデータを検索する
puts 'select where'
db.execute('SELECT * FROM books WHERE price = 480;') do |row|
  p row
end
