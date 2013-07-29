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
    K: (undefined for i in [1..7]).concat [50.00, 43.89, 35.93, 27.84, 33.65, 30.30, 44.10, 30.03, 31.86, 54.57, 69.72, 60.20, 56.80, 60.53, 59.02, 58.02, 41.79, 27.86, 18.57, 12.73, 29.32, 40.38, 60.25]
    D: (undefined for i in [1..7]).concat [50.00, 47.96, 43.95, 38.58, 36.94, 34.72, 37.85, 35.24, 34.11, 40.93, 50.53, 53.75, 54.77, 56.69, 57.47, 57.65, 52.36, 44.19, 35.65, 28.01, 28.45, 32.43, 41.70]
    J: (undefined for i in [1..7]).concat [50.00, 56.11, 60.00, 60.06, 43.51, 43.58, 25.35, 45.67, 38.62, 13.66, 12.15, 40.85, 50.70, 49.00, 54.36, 56.92, 73.51, 76.87, 69.82, 58.58, 26.71, 16.52, 4.60]
  
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
      expect(tana.EMA()).toEqual tana.EMA period: 20

    it 'answers with given period from 1 to LENGTH_OF_DI', ->
      expect(tana.EMA period: 1).toEqual DI
      expect(tana.EMA period: 5).toEqual EMA5
      expect(tana.EMA period: 10).toEqual EMA10
      expect(tana.EMA period: 20).toEqual EMA20
      
    it 'returns undefined when period is out of range', ->
      expect(tana.EMA period: -1).toBeUndefined()
      expect(tana.EMA period: 0).toBeUndefined()
      expect(tana.EMA period: 100).toBeUndefined()


  describe 'MACD', ->
    it 'has method MACD', ->
      expect(tana.MACD).toBeDefined()

    it 'has default value { short: 12, long: 26, ema: 9 }', ->
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

    it 'has default value { period: 9 }', ->
      expect(tana.KDJ()).toEqual tana.KDJ(9)

    it 'has correct answers', ->
      expect(tana.KDJ(9)).toEqual KDJ9

    it 'returns undefined when period is out of range', ->
      expect(tana.KDJ(-1)).toBeUndefined()
      expect(tana.KDJ(0)).toBeUndefined()
      expect(tana.KDJ(100)).toBeUndefined()



