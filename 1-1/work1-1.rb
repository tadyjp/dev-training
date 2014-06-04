require 'sinatra'

get '/test' do
  %Q{
    <form>
      <input name="a"> + <input name="b">
      <input type="submit" value="送信">
    </form>
    答え: #{params['a'].to_i + params['b'].to_i}
  }
end
