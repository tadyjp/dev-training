require 'sinatra'

get '/test' do
  if params['op'] == 'add'
    result = params['a'].to_i + params['b'].to_i
  elsif params['op'] == 'subtract'
    result = params['a'].to_i - params['b'].to_i
  elsif params['op'] == 'multiply'
    result = params['a'].to_i * params['b'].to_i
  elsif params['op'] == 'devide'
    result = params['a'].to_f / params['b'].to_f
  end

  %Q{
    <form>
      <input name="a">
      <select name="op">
        <option value="add">+</option>
        <option value="subtract">-</option>
        <option value="multiply">×</option>
        <option value="devide">÷</option>
      </select>
      <input name="b">
      <input type="submit" value="送信">
    </form>
    答え: #{result}
  }
end
