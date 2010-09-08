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

get '/schedule' do
  haml :schedule, :locals => {
    :games => schedule_games,
    :quarter_names => Quarters,
    :positions => Positions
  }
end

def schedule_games
  games = []
  GameDays.each_with_index do |game_day, game_idx|
    game = {}
    game[:number] = game_idx + 1
    game[:name] = game_day
    game[:quarters] = []
    (0..3).each do |quarter|
      game[:quarters][quarter] = []
      Positions.each_with_index do |position,idx|
        game[:quarters][quarter].push Players[idx]
      end
      to_the_front = Players.pop
      Players.unshift(to_the_front)
    end
    games << game
  end
  games
end
