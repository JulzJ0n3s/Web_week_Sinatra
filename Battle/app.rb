require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/attack'

class Battle < Sinatra::Base

  enable :sessions

    get '/' do
      erb :index
    end

    # get "/names" do
    #   erb :play
    # end

    post "/names" do
      player_1 = Player.new(params[:player_1_name])
      player_2 = Player.new(params[:player_2_name])
      @game = Game.create(player_1, player_2)
      redirect '/play'
    end

    before do
      @game = Game.instance
    end

    get '/play' do
      @game
      erb :play
    end

    get '/attack' do
      @game
      Attack.run(@game.opponent_of(@game.current_turn))
      erb :attack
    end

    post '/switch-turns' do
      # @game = $game
      @game.switch_turns
      redirect '/play' #:locals => { @game => $game }
    end
   
    run! if app_file == $0
end
