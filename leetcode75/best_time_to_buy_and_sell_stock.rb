# frozen_string_literal: true

#   Input: prices = [7,1,5,3,6,4]
#   Output: 5
#   Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
#   Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell
# @param {Integer[]} prices
# @return {Integer}

# alg    o(n)
# memory o(1)
def max_profit(prices)
  return 0 if prices.length < 2

  max_profit = 0
  current_profit = 0

  (0..prices.size - 2).each do |i|
    stock_diff = prices[i + 1] - prices[i]
    current_profit += stock_diff

    current_profit = 0 if current_profit < 0

    max_profit = [max_profit, current_profit].max
  end
  max_profit
end

p max_profit([7, 5, 3, 2, 1])
