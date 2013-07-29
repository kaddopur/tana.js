describe 'Tana', ->
  DI = [10.09 , 10.02, 9.74, 10.31, 9.92, 10.58, 10.94, 10.36, 10.12, 9.98, 9.88, 10.36, 10.13, 10.64, 9.90, 10.15, 10.77, 10.90, 10.30, 10.40, 10.58, 10.46, 10.46, 10.22, 9.97, 9.62, 9.63, 10.22, 10.22, 10.70]
  MA5 = (undefined for i in [1..4]).concat [10.02, 10.11, 10.30, 10.42, 10.38, 10.40, 10.26, 10.14, 10.09, 10.20, 10.18, 10.24, 10.32, 10.47, 10.40, 10.50, 10.59, 10.53, 10.44, 10.42, 10.34, 10.15, 9.98, 9.93, 9.93, 10.08]
  MA10 = (undefined for i in [1..9]).concat [10.21, 10.19, 10.22, 10.26, 10.29, 10.29, 10.25, 10.23, 10.28, 10.30, 10.34, 10.41, 10.42, 10.46, 10.41, 10.42, 10.37, 10.25, 10.19, 10.18, 10.21]
  MA20 = (undefined for i in [1..19]).concat [10.27, 10.30, 10.32, 10.36, 10.35, 10.36, 10.31, 10.24, 10.23, 10.24, 10.28]
  EMA5 = (undefined for i in [1..4]).concat [10.02, 10.20, 10.45, 10.42, 10.32, 10.21, 10.10, 10.19, 10.17, 10.32, 10.18, 10.17, 10.37, 10.55, 10.47, 10.44, 10.49, 10.48, 10.47, 10.39, 10.25, 10.04, 9.90, 10.01, 10.08, 10.29]
  EMA10 = (undefined for i in [1..9]).concat [10.21, 10.15, 10.19, 10.18, 10.26, 10.19, 10.19, 10.29, 10.40, 10.38, 10.39, 10.42, 10.43, 10.43, 10.40, 10.32, 10.19, 10.09, 10.11, 10.13, 10.24]
  EMA20 = (undefined for i in [1..19]).concat [10.27, 10.30, 10.32, 10.33, 10.32, 10.29, 10.22, 10.17, 10.17, 10.18, 10.23]
  MACD5_10_9 = 
    DIF: (undefined for i in [1..9]).concat [0.00, -0.05, 0.00, -0.01, 0.06, -0.01, -0.01, 0.08, 0.14, 0.08, 0.06, 0.07, 0.05, 0.04, -0.01, -0.07, -0.15, -0.19, -0.10, -0.05, 0.05]
    MACD: (undefined for i in [1..17]).concat [0.02, 0.03, 0.04, 0.04, 0.05, 0.04, 0.03, 0.01, -0.02, -0.05, -0.06, -0.06, -0.04]
    OSC: (undefined for i in [1..17]).concat [0.12, 0.05, 0.02, 0.02, 0.00, -0.01, -0.04, -0.08, -0.13, -0.13, -0.04, 0.01, 0.09]
  KDJ9 = 
    K: (undefined for i in [1..7]).concat [50.00, 44.61, 36.86, 28.73, 33.60, 29.93, 42.83, 29.16, 27.79, 45.74, 61.31, 53.57, 50.85, 54.49, 53.28, 52.47, 37.15, 24.77, 16.51, 11.31, 25.73, 35.34, 55.92]
    D: (undefined for i in [1..7]).concat [50.00, 48.20, 44.42, 39.19, 37.33, 34.86, 37.52, 34.73, 32.42, 36.86, 45.01, 47.86, 48.86, 50.73, 51.58, 51.88, 46.97, 39.57, 31.88, 25.03, 25.26, 28.62, 37.72]
    J: (undefined for i in [1..7]).concat [50.00, 55.39, 59.54, 60.12, 44.78, 44.73, 26.89, 45.88, 41.67, 19.09, 12.41, 36.46, 44.88, 43.23, 48.19, 50.69, 66.60, 69.17, 62.63, 52.46, 24.33, 15.18, 1.31]
  
  tana = new Tana DI
  

  describe 'MA', ->
    it 'has method MA', ->
      expect(tana.MA).toBeDefined()

    it 'has default value { period: 20 }', ->
      expect(tana.MA()).toEqual tana.MA(20)

    it 'answers with given period from 1 to LENGTH_OF_DI', ->
      expect(tana.MA(1)).toEqual DI
      expect(tana.MA(5)).toEqual MA5
      expect(tana.MA(10)).toEqual MA10
      expect(tana.MA(20)).toEqual MA20

    it 'returns undefined when period is out of range', ->
      expect(tana.MA(-1)).toBeUndefined()
      expect(tana.MA(0)).toBeUndefined()
      expect(tana.MA(100)).toBeUndefined()


  describe 'EMA', ->
    it 'has method EMA', ->
      expect(tana.EMA).toBeDefined()

    it 'has default value { period: 20 }', ->
      expect(tana.EMA()).toEqual tana.EMA(20)

    it 'answers with given period from 1 to LENGTH_OF_DI', ->
      expect(tana.EMA(1)).toEqual DI
      expect(tana.EMA(5)).toEqual EMA5
      expect(tana.EMA(10)).toEqual EMA10
      expect(tana.EMA(20)).toEqual EMA20
      
    it 'returns undefined when period is out of range', ->
      expect(tana.EMA(-1)).toBeUndefined()
      expect(tana.EMA(0)).toBeUndefined()
      expect(tana.EMA(100)).toBeUndefined()


  describe 'MACD', ->
    it 'has method MACD', ->
      expect(tana.MACD).toBeDefined()

    it 'has default value { short: 12, long: 26, ema: 9}', ->
      expect(tana.MACD()).toEqual tana.MACD(12, 26, 9)

    it 'has correct answers', ->
      expect(tana.MACD(5, 10, 9)).toEqual MACD5_10_9

    it 'returns undefined when period is out of range', ->
      expect(tana.MACD(-5, 10, 9)).toBeUndefined()
      expect(tana.MACD(5, -10, 9)).toBeUndefined()
      expect(tana.MACD(5, 10, -9)).toBeUndefined()


  describe 'KDJ', ->
    it 'has method KDJ', ->
      expect(tana.KDJ).toBeDefined()

    it 'has default value { period: 9}', ->
      expect(tana.KDJ()).toEqual tana.KDJ(9)

    it 'has correct answers', ->
      expect(tana.KDJ(9)).toEqual KDJ9

    it 'returns undefined when period is out of range', ->
      expect(tana.KDJ(-1)).toBeUndefined()
      expect(tana.KDJ(0)).toBeUndefined()
      expect(tana.KDJ(100)).toBeUndefined()





