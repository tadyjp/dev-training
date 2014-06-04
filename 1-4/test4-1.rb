require 'csv'

# csvファイルを開く
open('dataset/restaurants.csv', 'r') do |file|

  # `file.gets`でfileを1行読み取る
  # .chompで改行文字(CSVファイルの行末にある見えない文字)を取り除く
  # `CSV.parse_line`でcsv文字列を使いやすい形式に変換
  header = CSV.parse_line(file.gets.chomp)

  # ファイルの最後まで行を読み取って`line`に入れる
  while line = file.gets
    begin
      line_array = CSV.parse_line(line.chomp)

    # restaurants.csvには不正な改行があるのでエラーを無視する
    rescue CSV::MalformedCSVError
    end

    # 配列と配列をマージしてハッシュに変換する
    # 例) ['id', 'name'].zip(123, 'Taro')
    #     => [['id', 123], ['name': 'Taro']]
    # Hash[ [['id', 123], ['name': 'Taro']] ]
    #     => {'id' => 123, 'name' => 'Taro'}
    puts Hash[header.zip(line_array)]
  end
end

