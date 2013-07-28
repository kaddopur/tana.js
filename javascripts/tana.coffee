class Tana
  constructor: (@di) ->

  @roundArray: (list) ->
    list.map (x) -> Math.round(x * 100) / 100 if x?


  MA: (period=20, target=@di) ->
    return undefined unless 1 <= period <= target.length
      
    ma = []
    ma.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ma = sum / period
    ma.push current_ma
    
    ma.push current_ma += (target[i] - target[i-period]) / period for i in [period...target.length]
    Tana.roundArray(ma)
    

  EMA: (period=20, target=@di) ->
    return undefined unless 1 <= period <= target.length
    alpha = 2 / (period + 1)

    ema = []
    ema.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ema = sum / period
    ema.push current_ema

    ema.push current_ema = ema[i-1] + alpha * (target[i] - ema[i-1]) for i in [period...target.length]
    Tana.roundArray(ema)


  MACD: (period=20) ->
    undefined

  


