require 'pry'
require 'pry-debugger'
require 'yahoofinance'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/quote' do
  @symbol = params[:symbol]
  @price = get_quote(@symbol.upcase) if !@symbol.nil?
  erb :stock
end

def get_quote(name)

    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, name)[name].lastTrade
    rescue
      retry
    end
end