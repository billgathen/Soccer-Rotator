#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'

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
  output = ""
  GameDays.each_with_index do |game_day, game_idx|
    output += "<h1>GAME #{game_idx+1}: #{game_day}<h1>\n"
    (0..3).each do |quarter|
      output += "<h3>#{Quarters[quarter]} quarter</h3>\n"
      output += "<ul>\n"
      9.times do |idx|
        output += "<li>#{Positions[idx]}: #{Players[idx]}</li>\n"
      end
      output += "</ul>\n"
      to_the_front = Players.pop
      Players.unshift(to_the_front)
    end
  end
  output
end
