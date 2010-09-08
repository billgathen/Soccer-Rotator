require 'rubygems'
require 'sinatra'
require 'haml'

Quarters = ["1st","2nd","3rd","4th"]

get '/' do
  haml :form
end

post '/schedule' do
  positions = [
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
  game_days = []
  players = []
  params.keys.sort.each do |k|
    if k =~ /game/
      game_days << params[k] unless params[k].size == 0
    elsif k =~ /player/
      players << params[k] unless params[k].size == 0
    end
  end

  positions.delete("Right Bench") if players.size < 9
  positions.delete("Middle Bench") if players.size < 8
  positions.delete("Left Bench") if players.size < 7

  haml :schedule, :locals => {
    :games => schedule_games(positions, game_days,players),
    :quarter_names => Quarters,
    :positions => positions
  }
end

def schedule_games(positions, game_days, players)
  games = []
  if players.size < 6
    games = "Need at least 6 players to create a schedule"
  else
    game_days.each_with_index do |game_day, game_idx|
      game = {}
      game[:number] = game_idx + 1
      game[:name] = game_day
      game[:quarters] = []
      (0..3).each do |quarter|
        game[:quarters][quarter] = []
        positions.each_with_index do |position,idx|
          game[:quarters][quarter] << players[idx]
        end
        to_the_front = players.pop
        players.unshift(to_the_front)
      end
      games << game
    end
  end
  games
end
