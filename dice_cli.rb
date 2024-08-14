require_relative 'dice_roll'

puts "Enter the number of dice to roll:"
num_dice = gets.chomp.to_i

dice = []
num_dice.times do |i|
  puts "Enter the number of edges for dice ##{i + 1}:"
  edges = gets.chomp.to_i
  dice << Dice.new(edges)
end

roller = DiceRoller.new(dice)
result = roller.roll_all_dice

puts result.to_s
