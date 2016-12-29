def coin_change(coins, goal)
  coin_change_helper(coins.sort!.reverse!, goal, 0, {})
end

def coin_change_helper(coins, goal, index, map)
  if goal == 0
    return 1
  elsif index > coins.length - 1
    return 0
  end

  remaining = goal
  current_coin = coins[index]
  ways = []

  while remaining >= current_coin or remaining == 0
    ways << coin_change_helper(coins, remaining, index + 1, map)
    remaining = remaining - current_coin
  end

  ways.inject(&:+)
end

coins = [3, 2, 1]
target_goal = 4

p coin_change(coins, target_goal)

