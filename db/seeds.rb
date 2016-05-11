# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

races = ["zerg", "terran", "protoss"]
inc = 0
1.upto(10).each do |i|
  Player.create(name: "player " + inc.to_s )
  i += 1
end


1.upto(100).each do |i|
  random_number = [*1..9].sample
  winner = Player.find(random_number)
  loser = Player.find(random_number+1)
  Match.create(winner_faction: races[random_number%3], loser_faction:races[(random_number+1)%3], duration: i, winner_id: winner.id, loser_id: loser.id)
end
