def coin_count(goal, coins)
end

input = File.new("./input")

input.each do |line|
  goal = line[0].to_i
  coins = input.readline.split(" ").map{ |c| c.to_i }
  coin_count(goal, coins)
end
