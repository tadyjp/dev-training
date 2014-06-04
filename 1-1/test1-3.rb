require 'sinatra'

get '/test' do
  %Q{
    <a href="/test?a=b">リンク</a>
    <br>
    入力された文字: #{params['a']}
  }
end
