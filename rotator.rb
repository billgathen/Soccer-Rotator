#!/usr/bin/env ruby

game_days = [
  "Sept. 11",
  "Sept. 18",
  "Sept. 25",
  "Oct. 2",
  "Oct. 9",
  "Oct. 16"
]

players = [
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

Quarters = ["1st","2nd","3rd","4th"]

game_days.each_with_index do |game_day, game_idx|
  puts "\nGAME #{game_idx+1}: #{game_day}"
  (0..3).each do |quarter|
    puts "#{Quarters[quarter]} quarter"
    9.times do |idx|
      puts "\t#{positions[idx]}: #{players[idx]}"
    end
    to_the_front = players.pop
    players.unshift(to_the_front)
  end
  puts "-" * 30
end
