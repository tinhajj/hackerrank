def coin_dp(goal, coins, index)
  if goal == 0
    1
  end

  if goal > coins[-1]
    0
  end

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
