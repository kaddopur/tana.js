describe 'SMA', ->
  prices = []
  tana = null

  beforeEach ->
    prices = [0,1,2,3,4,5,6,7,8,9]
    tana = new Tana prices

  it 'has method SMA', ->
    expect(tana.SMA).toBeDefined()

  it 'has default value { peroid: 5 }', ->
    expect(tana.SMA()).toEqual tana.SMA(5)

  it 'answers with given peroid from 1 to LENGTH_OF_PRICES', ->
    expect(tana.SMA(1)).toEqual [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(tana.SMA(2)).toEqual [undefined, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5]
    expect(tana.SMA(prices.length)).toEqual [undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 4.5]

  it 'returns undefined when peroid is out of range', ->
    expect(tana.SMA(-1)).toBeUndefined()
    expect(tana.SMA(0)).toBeUndefined()
    expect(tana.SMA(20)).toBeUndefined()


describe 'EMA', ->
  prices = []
  tana = null

  beforeEach ->
    # alpha = 2 / (peroid + 1)
    prices = [0,1,2,3,4,5,6,7,8,9]
    tana = new Tana prices

  it 'has method EMA', ->
    expect(tana.EMA).toBeDefined()

  it 'has default value { peroid: LENGTH_OF_PRICES }', ->
    expect(tana.EMA()).toEqual tana.EMA(prices.length)

  it 'answers with given peroid from 1 to LENGTH_OF_PRICES', ->
    expect(tana.EMA(1)).toEqual [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expect(tana.EMA(5)).toEqual [0, 0.333, 0.889, 1.593, 2.395, 3.263, 4.176, 5.117, 6.078, 7.052]
    expect(tana.EMA(prices.length)).toEqual [0, 0.182, 0.512, 0.965, 1.517, 2.150, 2.850, 3.604, 4.404, 5.239]

  it 'returns undefined when peroid is out of range', ->
    expect(tana.EMA(-1)).toBeUndefined()
    expect(tana.EMA(0)).toBeUndefined()
    expect(tana.EMA(20)).toBeUndefined()

