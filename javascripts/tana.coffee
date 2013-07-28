class Tana
  constructor: (@prices) ->

  SMA: (peroid=5) ->
    unless 1 <= peroid <= @prices.length
      return undefined

    sma = []
    sma.push undefined for i in [0...peroid-1]

    avg = 0
    avg += @prices[i] for i in [0...peroid]
    avg /= peroid
    sma.push avg
    
    for i in [peroid...@prices.length]
      avg += (@prices[i] - @prices[i-peroid]) / peroid
      sma.push Math.round(avg * 1000) / 1000
    sma
    
  EMA: (peroid) ->
    peroid = @prices.length if peroid is undefined
    unless 1 <= peroid <= @prices.length
      return undefined

    ema = []
    ema.push @prices[0]

    alpha = 2 / (peroid + 1)

    for i in [1...@prices.length]
      ema.push ema[i-1] + alpha * (@prices[i] - ema[i-1])

    Math.round(element * 1000) / 1000 for element in ema


