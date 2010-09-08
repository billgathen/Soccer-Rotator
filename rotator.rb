require 'rubygems'
require 'sinatra'
require 'haml'

GameDays = [
  "Sept. 11",
  "Sept. 18",
  "Sept. 25",
  "Oct. 2",
  "Oct. 9",
  "Oct. 16"
]

Players = [
  "Alex",
  "Andrew",
  "Eddie",
  "Griffin",
  "Jacob",
  "Jake",
  "Javen",
  "Lukas",
  "Trowah"
]

Positions = [
  "Left Forward",
  "Left Defender",
  "Left Bench",
  "Midfielder",
  "Keeper",
  "Middle Bench",
  "Right Forward",
  "Right Defender",
  "Right Bench"
]

Quarters = ["1st","2nd","3rd","4th"]

get '/' do
  haml :form
end

post '/schedule' do
  game_days = []
  players = []
  params.keys.sort.each do |k|
    if k =~ /game/
      game_days << params[k]
    elsif k =~ /player/
      players << params[k]
    end
  end
  haml :schedule, :locals => {
    :games => schedule_games(game_days,players),
    :quarter_names => Quarters,
    :positions => Positions
  }
end

def schedule_games(game_days, players)
  games = []
  game_days.each_with_index do |game_day, game_idx|
    game = {}
    game[:number] = game_idx + 1
    game[:name] = game_day
    game[:quarters] = []
    (0..3).each do |quarter|
      game[:quarters][quarter] = []
      Positions.each_with_index do |position,idx|
        game[:quarters][quarter] << players[idx]
      end
      to_the_front = players.pop
      players.unshift(to_the_front)
    end
    games << game
  end
  games
end
