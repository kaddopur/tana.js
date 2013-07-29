class Tana
  constructor: (@di) ->


  util_round: (list) ->
    list.map (x) -> Math.round(x * 100) / 100 if x?


  util_ema: (argv) ->
    prefix = argv.target.filter (x) -> not x?
    argv.target = argv.target.filter (x) -> x?
    argv.round = false
    prefix.concat @EMA(argv)


  MA: (argv) ->
    argv = {period: 20, target: @di, round: true} if argv is undefined
    period = if argv.hasOwnProperty('period') then argv.period else 20
    target = if argv.hasOwnProperty('target') then argv.target else @di
    round = if argv.hasOwnProperty('round') then argv.round else true

    return undefined unless 1 <= period <= target.length
      
    ma = []
    ma.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ma = sum / period
    ma.push current_ma
    
    ma.push current_ma += (target[i] - target[i-period]) / period for i in [period...target.length]
    if round then @util_round(ma) else ma
    

  EMA: (argv) ->
    argv = {period: 20, target: @di, round: true} if argv is undefined
    period = if argv.hasOwnProperty('period') then argv.period else 20
    target = if argv.hasOwnProperty('target') then argv.target else @di
    round = if argv.hasOwnProperty('round') then argv.round else true

    return undefined unless 1 <= period <= target.length
    alpha = 2 / (period + 1)

    ema = []
    ema.push undefined for i in [1...period]

    sum = target.slice(0, period).reduce (a, e) -> a + e
    current_ema = sum / period
    ema.push current_ema

    ema.push current_ema = ema[i-1] + alpha * (target[i] - ema[i-1]) for i in [period...target.length]
    if round then @util_round(ema) else ema


  MACD: (argv) ->
    argv = {short:12, long:26, ema_period:9} if argv is undefined
    short = if argv.hasOwnProperty('short') then argv.short else 12
    long = if argv.hasOwnProperty('long') then argv.long else 26
    ema_period = if argv.hasOwnProperty('ema_period') then argv.ema_period else 9

    return unless 1 <= Math.min(short, long, ema_period) and Math.max(short, long, ema_period) <= @di.length 
    ema_short = @util_ema 
      period: short
      target: @di

    ema_long = @util_ema
      period: long
      target: @di

    dif = for i in [0...ema_short.length]
      if ema_short[i] isnt undefined and ema_long[i] isnt undefined
        ema_short[i] - ema_long[i]
      else
        undefined

    macd = @util_ema
      period: ema_period
      target: dif
    
    osc = for i in [0...ema_short.length]
      if dif[i] isnt undefined and macd[i] isnt undefined
        dif[i] - macd[i]
      else
        undefined 

    {DIF:@util_round(dif), MACD:@util_round(macd), OSC:@util_round(osc)}

    
  KDJ: (argv) ->
    argv = {period: 9} if argv is undefined
    period = if argv.hasOwnProperty('period') then argv.period else 9

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

    rsv = for i in [0...@di.length]
      if high[i]? and low[i]?
        (@di[i] - low[i]) / (high[i] - low[i]) * 100
      else
        undefined

    k = @util_ema
      period: 5
      target: rsv

    d = @util_ema
      period: 5
      target: k

    j = for i in [0...@di.length]
      if k[i]? and d[i]?
        3 * d[i] - 2 * k[i]
      else
        undefined
        
    {K: @util_round(k), D: @util_round(d), J: @util_round(j)}



