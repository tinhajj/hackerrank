def coin_change(coins, goal)
  coin_change_helper(coins.sort!.reverse!, goal, 0, {})
end

def coin_change_helper(coins, goal, index, map)
  if map["#{goal} - #{index}"]
    return map["#{goal} - #{index}"]
  elsif goal == 0
    return 1
  elsif index > coins.length - 1
    return 0
  end

  remaining = goal
  current_coin = coins[index]

  ways_total = []

  while remaining >= current_coin or remaining >= 0
    ways_subproblem = coin_change_helper(coins, remaining, index + 1, map)
    map["#{remaining} - #{index + 1}"] = ways_subproblem
    ways_total << ways_subproblem

    remaining = remaining - current_coin
  end

  ways_total.inject(&:+)
end

#target = gets.split(' ')[0].to_i
#coins = gets.split(' ').map(&:to_i)

p coin_change(coins, target)
