require 'bundler/setup'
Bundler.require(:default)

require_relative 'game/battle'

#Bring me Thanos....
print "Enter battle instruction input file path: "
input_file_path = gets().chomp
battle = Battle.new(input_file_path)
if battle.valid_input? 
  battle.commence

  #generate mission_report.
  battle.generate_mission_report

  #declare winner
  battle.declare_winner
else
  puts "you can't start a battle without a valid input file."
end