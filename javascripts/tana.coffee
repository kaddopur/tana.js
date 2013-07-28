class Tana
  constructor: (@prices) ->

  SMA: (n=5) ->
    unless 1 <= n <= @prices.length
      return (NaN for i in [1..@prices.length])

    sma = []
    sma.push NaN for i in [0...n-1]

    avg = 0
    avg += @prices[i] for i in [0...n]
    avg /= n
    sma.push avg
    
    for i in [n...@prices.length]
      sma.push avg += (@prices[i] - @prices[i-n]) / n

    sma

$ ->
  test_prices = [0,1,2,3,4,5,6,7,8,9]
  a = new Tana test_prices
  console.log test_prices
  console.log a.SMA(20)