require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult_1 = Cult.new("Cult_1", "Seattle", 2018, "Slogan_1", 18)
cult_2 = Cult.new("Cult_2", "Seattle", 2000, "Slogan_2", 21)
cult_3 = Cult.new("Cult_3", "New York", 1900, "Slogan_3")

follower_1 = Follower.new("Follower_1", 19, "Life_motto_1")
follower_2 = Follower.new("Follower_2", 30, "Life_motto_2")
follower_3 = Follower.new("Follower_3", 27, "Life_motto_3")
follower_4 = Follower.new("Follower_4", 27, "Life_motto_3")
follower_5 = Follower.new("Follower_5", 40, "Life_motto_4")
follower_6 = Follower.new("Follower_6", 40, "Life_motto_4")
follower_7 = Follower.new("Follower_7", 40, "Life_motto_4")
follower_8 = Follower.new("Follower_8", 40, "Life_motto_4")
follower_9 = Follower.new("Follower_9", 40, "Life_motto_4")
follower_10 = Follower.new("Follower_10", 40, "Life_motto_4")
follower_11 = Follower.new("Follower_11", 40, "Life_motto_4")

# blood_oath_1 = BloodOath.new(cult_1, follower_1)
# blood_oath_2 = BloodOath.new(cult_2, follower_1)
# blood_oath_3 = BloodOath.new(cult_2, follower_2)
# blood_oath_4 = BloodOath.new(cult_3, follower_3)

follower_1.join_cult(cult_1)
follower_1.join_cult(cult_3)
follower_2.join_cult(cult_2)
follower_3.join_cult(cult_3)
follower_4.join_cult(cult_3)
follower_5.join_cult(cult_3)
follower_6.join_cult(cult_3)
follower_7.join_cult(cult_3)
follower_8.join_cult(cult_3)
follower_9.join_cult(cult_3)
follower_10.join_cult(cult_3)
follower_11.join_cult(cult_3)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
