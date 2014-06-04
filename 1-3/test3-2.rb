open('output3-1.txt', 'r') do |file| # 1.ファイルを開く、「r」は読み込みモード
  puts file.read # 2.ファイルから文字を読み取る
end # ファイルを閉じる
