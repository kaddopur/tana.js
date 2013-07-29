// Generated by CoffeeScript 1.6.2
describe('Tana', function() {
  var DI, EMA10, EMA20, EMA5, KDJ9, MA10, MA20, MA5, MACD5_10_9, RSI10, WR9, i, tana;

  DI = [10.09, 10.02, 9.74, 10.31, 9.92, 10.58, 10.94, 10.36, 10.12, 9.98, 9.88, 10.36, 10.13, 10.64, 9.90, 10.15, 10.77, 10.90, 10.30, 10.40, 10.58, 10.46, 10.46, 10.22, 9.97, 9.62, 9.63, 10.22, 10.22, 10.70];
  MA5 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 4; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.02, 10.11, 10.30, 10.42, 10.38, 10.40, 10.26, 10.14, 10.09, 10.20, 10.18, 10.24, 10.32, 10.47, 10.40, 10.50, 10.59, 10.53, 10.44, 10.42, 10.34, 10.15, 9.98, 9.93, 9.93, 10.08]);
  MA10 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 9; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.21, 10.19, 10.22, 10.26, 10.29, 10.29, 10.25, 10.23, 10.28, 10.30, 10.34, 10.41, 10.42, 10.46, 10.41, 10.42, 10.37, 10.25, 10.19, 10.18, 10.21]);
  MA20 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 19; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.27, 10.30, 10.32, 10.36, 10.35, 10.36, 10.31, 10.24, 10.23, 10.24, 10.28]);
  EMA5 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 4; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.02, 10.20, 10.45, 10.42, 10.32, 10.21, 10.10, 10.19, 10.17, 10.32, 10.18, 10.17, 10.37, 10.55, 10.47, 10.44, 10.49, 10.48, 10.47, 10.39, 10.25, 10.04, 9.90, 10.01, 10.08, 10.29]);
  EMA10 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 9; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.21, 10.15, 10.19, 10.18, 10.26, 10.19, 10.19, 10.29, 10.40, 10.38, 10.39, 10.42, 10.43, 10.43, 10.40, 10.32, 10.19, 10.09, 10.11, 10.13, 10.24]);
  EMA20 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 19; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([10.27, 10.30, 10.32, 10.33, 10.32, 10.29, 10.22, 10.17, 10.17, 10.18, 10.23]);
  MACD5_10_9 = {
    DIF: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 9; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([0.00, -0.05, 0.00, -0.01, 0.06, -0.01, -0.01, 0.08, 0.14, 0.08, 0.06, 0.07, 0.05, 0.04, -0.01, -0.07, -0.15, -0.19, -0.10, -0.05, 0.05]),
    MACD: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 17; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([0.02, 0.03, 0.04, 0.04, 0.05, 0.04, 0.03, 0.01, -0.02, -0.05, -0.06, -0.06, -0.04]),
    OSC: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 17; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([0.12, 0.05, 0.02, 0.02, 0.00, -0.01, -0.04, -0.08, -0.13, -0.13, -0.04, 0.01, 0.09])
  };
  KDJ9 = {
    K: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 12; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([26.44, 41.53, 28.31, 30.72, 53.81, 69.21, 59.86, 56.58, 60.38, 58.92, 57.95, 41.74, 27.83, 18.55, 12.72, 29.31, 40.37, 60.25]),
    D: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 16; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([36.16, 47.18, 51.41, 53.13, 55.55, 56.67, 57.10, 51.98, 43.93, 35.47, 27.89, 28.36, 32.36, 41.66]),
    J: ((function() {
      var _i, _results;

      _results = [];
      for (i = _i = 1; _i <= 16; i = ++_i) {
        _results.push(void 0);
      }
      return _results;
    })()).concat([0.86, 3.12, 34.49, 46.24, 45.87, 52.17, 55.40, 72.45, 76.13, 69.31, 58.23, 26.46, 16.35, 4.48])
  };
  RSI10 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 10; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([46.90, 59.61, 52.28, 64.21, 44.49, 50.74, 63.27, 65.51, 48.70, 51.25, 56.05, 51.89, 51.89, 42.46, 34.48, 26.10, 26.72, 54.41, 54.41, 68.76]);
  WR9 = ((function() {
    var _i, _results;

    _results = [];
    for (i = _i = 1; _i <= 8; i = ++_i) {
      _results.push(void 0);
    }
    return _results;
  })()).concat([68.33, 80.00, 88.33, 54.72, 76.42, 28.30, 98.11, 64.47, 0.00, 0.00, 58.82, 50.00, 32.00, 44.00, 44.00, 90.67, 100.00, 100.00, 98.96, 37.50, 37.50, 0.00]);
  tana = new Tana(DI);
  describe('MA', function() {
    it('has method MA', function() {
      return expect(tana.MA).toBeDefined();
    });
    it('has default value { period: 20 }', function() {
      return expect(tana.MA()).toEqual(tana.MA({
        period: 20
      }));
    });
    it('answers with given period from 1 to LENGTH_OF_DI', function() {
      expect(tana.MA({
        period: 1
      })).toEqual(DI);
      expect(tana.MA({
        period: 5
      })).toEqual(MA5);
      expect(tana.MA({
        period: 10
      })).toEqual(MA10);
      return expect(tana.MA({
        period: 20
      })).toEqual(MA20);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.MA({
        period: -1
      })).toBeUndefined();
      expect(tana.MA({
        period: 0
      })).toBeUndefined();
      return expect(tana.MA({
        period: 100
      })).toBeUndefined();
    });
  });
  describe('EMA', function() {
    it('has method EMA', function() {
      return expect(tana.EMA).toBeDefined();
    });
    it('has default value { period: 20 }', function() {
      return expect(tana.EMA()).toEqual(tana.EMA({
        period: 20
      }));
    });
    it('answers with given period from 1 to LENGTH_OF_DI', function() {
      expect(tana.EMA({
        period: 1
      })).toEqual(DI);
      expect(tana.EMA({
        period: 5
      })).toEqual(EMA5);
      expect(tana.EMA({
        period: 10
      })).toEqual(EMA10);
      return expect(tana.EMA({
        period: 20
      })).toEqual(EMA20);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.EMA({
        period: -1
      })).toBeUndefined();
      expect(tana.EMA({
        period: 0
      })).toBeUndefined();
      return expect(tana.EMA({
        period: 100
      })).toBeUndefined();
    });
  });
  describe('MACD', function() {
    it('has method MACD', function() {
      return expect(tana.MACD).toBeDefined();
    });
    it('has default value { short: 12, long: 26, ema: 9 }', function() {
      return expect(tana.MACD()).toEqual(tana.MACD({
        short: 12,
        long: 26,
        ema_period: 9
      }));
    });
    it('has correct answers', function() {
      return expect(tana.MACD({
        short: 5,
        long: 10,
        ema_period: 9
      })).toEqual(MACD5_10_9);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.MACD({
        short: -5,
        long: 10,
        ema_period: 9
      })).toBeUndefined();
      expect(tana.MACD({
        short: 5,
        long: -10,
        ema_period: 9
      })).toBeUndefined();
      return expect(tana.MACD({
        short: 5,
        long: 10,
        ema_period: -9
      })).toBeUndefined();
    });
  });
  describe('KDJ', function() {
    it('has method KDJ', function() {
      return expect(tana.KDJ).toBeDefined();
    });
    it('has default value { period: 9 }', function() {
      return expect(tana.KDJ()).toEqual(tana.KDJ({
        period: 9
      }));
    });
    it('has correct answers', function() {
      return expect(tana.KDJ({
        period: 9
      })).toEqual(KDJ9);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.KDJ({
        period: -1
      })).toBeUndefined();
      expect(tana.KDJ({
        period: 0
      })).toBeUndefined();
      return expect(tana.KDJ({
        period: 100
      })).toBeUndefined();
    });
  });
  describe('RSI', function() {
    it('has method RSI', function() {
      return expect(tana.RSI).toBeDefined();
    });
    it('has default value { period: 10 }', function() {
      return expect(tana.RSI()).toEqual(tana.RSI({
        period: 10
      }));
    });
    it('has correct answers', function() {
      return expect(tana.RSI({
        period: 10
      })).toEqual(RSI10);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.RSI({
        period: -1
      })).toBeUndefined();
      expect(tana.RSI({
        period: 0
      })).toBeUndefined();
      return expect(tana.RSI({
        period: 100
      })).toBeUndefined();
    });
  });
  return describe('W%R', function() {
    it('has method W%R', function() {
      return expect(tana.WR).toBeDefined();
    });
    it('has default value { period: 14 }', function() {
      return expect(tana.WR()).toEqual(tana.WR({
        period: 14
      }));
    });
    it('has correct answers', function() {
      return expect(tana.WR({
        period: 9
      })).toEqual(WR9);
    });
    return it('returns undefined when period is out of range', function() {
      expect(tana.WR({
        period: -1
      })).toBeUndefined();
      expect(tana.WR({
        period: 0
      })).toBeUndefined();
      return expect(tana.WR({
        period: 100
      })).toBeUndefined();
    });
  });
});
