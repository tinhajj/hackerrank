def coin_dp(goal, coins, index)
  amountRemaining = goal - coins[index]
  coin_dp(amountRemaining, coins, index + 1)
end

def coin_count(goal, coins)
  coin_dp(goal, coins, 0)
end

input = File.new("./input")

input.each do |line|
  goal = line[0].to_i
  coins = input.readline.split(" ").map{ |c| c.to_i }
  coin_count(goal, coins)
end
