class Tana
  constructor: (@di) ->


  util_round: (list) ->
    list.map (x) -> Math.round(x * 100) / 100 if x?


  util_ema: (period, list) ->
    prefix = list.filter (x) -> not x?
    target = list.filter (x) -> x?
    prefix.concat @EMA(period, target, false)


  MA: (period=20, target=@di, round=true) ->
    return undefined unless 1 <= period <= target.length
      
    ma = []
    ma.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ma = sum / period
    ma.push current_ma
    
    ma.push current_ma += (target[i] - target[i-period]) / period for i in [period...target.length]
    if round then @util_round(ma) else ma
    

  EMA: (period=20, target=@di, round=true) ->
    return undefined unless 1 <= period <= target.length
    alpha = 2 / (period + 1)

    ema = []
    ema.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ema = sum / period
    ema.push current_ema

    ema.push current_ema = ema[i-1] + alpha * (target[i] - ema[i-1]) for i in [period...target.length]
    if round then @util_round(ema) else ema


  MACD: (short=12, long=26, ema_period=9) ->
    return unless 1 <= Math.min(short, long, ema_period) and Math.max(short, long, ema_period) <= @di.length 
    ema_short = @util_ema(short, @di)
    ema_long = @util_ema(long, @di)

    dif = for i in [0...ema_short.length]
      if ema_short[i] isnt undefined and ema_long[i] isnt undefined
        ema_short[i] - ema_long[i]
      else
        undefined

    macd = @util_ema(ema_period, dif)
    
    osc = for i in [0...ema_short.length]
      if dif[i] isnt undefined and macd[i] isnt undefined
        dif[i] - macd[i]
      else
        undefined 

    {DIF:@util_round(dif), MACD:@util_round(macd), OSC:@util_round(osc)}

    
  KDJ: (period=9) ->
    return undefined unless 1 <= period <= @di.length

    high = for i in [0...@di.length]
      if i < period-1
        undefined 
      else
        @di.slice(i-period+1, i+1).reduce (a, b) -> Math.max a, b

    low = for i in [0...@di.length]
      if i < period-1
        undefined 
      else
        @di.slice(i-period+1, i+1).reduce (a, b) -> Math.min a, b

    console.log high
    console.log low



