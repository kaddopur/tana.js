describe 'Tana', ->
  DI = [10.09 , 10.02, 9.74, 10.31, 9.92, 10.58, 10.94, 10.36, 10.12, 9.98, 9.88, 10.36, 10.13, 10.64, 9.90, 10.15, 10.77, 10.90, 10.30, 10.40, 10.58, 10.46, 10.46, 10.22, 9.97, 9.62, 9.63, 10.22, 10.22, 10.70]
  MA5 = (undefined for i in [1..4]).concat [10.02, 10.11, 10.30, 10.42, 10.38, 10.40, 10.26, 10.14, 10.09, 10.20, 10.18, 10.24, 10.32, 10.47, 10.40, 10.50, 10.59, 10.53, 10.44, 10.42, 10.34, 10.15, 9.98, 9.93, 9.93, 10.08]
  MA10 = (undefined for i in [1..9]).concat [10.21, 10.19, 10.22, 10.26, 10.29, 10.29, 10.25, 10.23, 10.28, 10.30, 10.34, 10.41, 10.42, 10.46, 10.41, 10.42, 10.37, 10.25, 10.19, 10.18, 10.21]
  MA20 = (undefined for i in [1..19]).concat [10.27, 10.30, 10.32, 10.36, 10.35, 10.36, 10.31, 10.24, 10.23, 10.24, 10.28]
  EMA5 = (undefined for i in [1..4]).concat [10.02, 10.20, 10.45, 10.42, 10.32, 10.21, 10.10, 10.19, 10.17, 10.32, 10.18, 10.17, 10.37, 10.55, 10.47, 10.44, 10.49, 10.48, 10.47, 10.39, 10.25, 10.04, 9.90, 10.01, 10.08, 10.29]
  EMA10 = (undefined for i in [1..9]).concat [10.21, 10.15, 10.19, 10.18, 10.26, 10.19, 10.19, 10.29, 10.40, 10.38, 10.39, 10.42, 10.43, 10.43, 10.40, 10.32, 10.19, 10.09, 10.11, 10.13, 10.24]
  EMA20 = (undefined for i in [1..19]).concat [10.27, 10.30, 10.32, 10.33, 10.32, 10.29, 10.22, 10.17, 10.17, 10.18, 10.23]

  tana = new Tana DI

  describe 'MA', ->
    it 'has method MA', ->
      expect(tana.MA).toBeDefined()

    it 'has default value { peroid: 20 }', ->
      expect(tana.MA()).toEqual tana.MA(20)

    it 'answers with given peroid from 1 to LENGTH_OF_DI', ->
      expect(tana.MA(1)).toEqual DI
      expect(tana.MA(5)).toEqual MA5
      expect(tana.MA(10)).toEqual MA10
      expect(tana.MA(20)).toEqual MA20

    it 'returns undefined when peroid is out of range', ->
      expect(tana.MA(-1)).toBeUndefined()
      expect(tana.MA(0)).toBeUndefined()
      expect(tana.MA(100)).toBeUndefined()


  describe 'EMA', ->
    it 'has method EMA', ->
      expect(tana.EMA).toBeDefined()

    it 'has default value { peroid: 20 }', ->
      expect(tana.EMA()).toEqual tana.EMA(20)

    it 'answers with given peroid from 1 to LENGTH_OF_DI', ->
      expect(tana.EMA(1)).toEqual DI
      expect(tana.EMA(5)).toEqual EMA5
      expect(tana.EMA(10)).toEqual EMA10
      expect(tana.EMA(20)).toEqual EMA20
      

    it 'returns undefined when peroid is out of range', ->
      expect(tana.EMA(-1)).toBeUndefined()
      expect(tana.EMA(0)).toBeUndefined()
      expect(tana.EMA(100)).toBeUndefined()


  describe 'MACD', ->
    it 'has method MACD', ->
      expect(tana.MACD).toBeDefined()

    it 'has default value { short: 12, long: 26, ema: 9}', ->
      expect(tana.MACD()).toEqual tana.MACD(12, 26, 9)

  

