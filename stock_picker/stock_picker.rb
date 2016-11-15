# Implement a method #stock_picker that takes in an
# array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best
# day to buy and the best day to sell. Days start at 0.

# * You need to buy before you can sell
# * Pay attention to edge cases like when the lowest day
#   is the last day or the highest day is the first day.

def stock_picker(price_array)
  best_pick = [0,0]
  last_day = price_array.length - 1

  (0..last_day).each do |buy_day|
    (buy_day..last_day).each do |sell_day|
      test_sale = price_array[sell_day] - price_array[buy_day]
      current_best_sale = price_array[best_pick[1]] - price_array[best_pick[0]]
      
      if test_sale > current_best_sale
        best_pick = [buy_day, sell_day]
      end
    end
  end
  best_pick == [0,0] ? nil : best_pick
end

if stock_picker([17,3,6,9,15,8,6,1,10]) == [1,4]
  puts true
else
  puts stock_picker([17,3,6,9,15,8,6,1,10])
end

if stock_picker([9,3,6,1,15,8,6,17,10]) == [3,7]
  puts true
else
  puts stock_picker([9,3,6,1,15,8,6,17,10])
end

if stock_picker([1,2,3,4,5,6,7,8]) == [0,7]
  puts true
else
  puts stock_picker([1,2,3,4,5,6,7,8])
end

if stock_picker([8,7,6,5,4,3,2,1]) == nil
  puts true
else
  puts stock_picker([8,7,6,5,4,3,2,1])
end