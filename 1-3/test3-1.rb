open('output3-1.txt', 'w') do |file| # 1.ファイルを開く、「w」は書き込みモード
  file.write "This is test text!" # 2.ファイルに文字を書き込む
end # ファイルを閉じる
