require('sinatra')
require('sinatra/reloader') if development?

require_relative('./models/game_mechanics.rb')
also_reload('./models/*')

get '/RPS/:hand1/:hand2' do
  hand1 = params[:hand1].to_s
  hand2 = params[:hand2].to_s
  @winner = Game.check_win(hand1, hand2)
  erb(:result)
end

get '/' do
  erb(:home)
end
