// Generated by CoffeeScript 1.6.2
var Tana;

Tana = (function() {
  function Tana(di) {
    this.di = di;
  }

  Tana.prototype.util_round = function(list) {
    return list.map(function(x) {
      if (x != null) {
        return Math.round(x * 100) / 100;
      }
    });
  };

  Tana.prototype.util_ema = function(argv) {
    var prefix;

    prefix = argv.target.filter(function(x) {
      return x == null;
    });
    argv.target = argv.target.filter(function(x) {
      return x != null;
    });
    argv.round = false;
    return prefix.concat(this.EMA(argv));
  };

  Tana.prototype.MA = function(argv) {
    var current_ma, i, ma, period, round, sum, target, _i, _j, _ref;

    if (argv === void 0) {
      argv = {
        period: 20,
        target: this.di,
        round: true
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 20;
    target = argv.hasOwnProperty('target') ? argv.target : this.di;
    round = argv.hasOwnProperty('round') ? argv.round : true;
    if (!((1 <= period && period <= target.length))) {
      return void 0;
    }
    ma = [];
    for (i = _i = 1; 1 <= period ? _i < period : _i > period; i = 1 <= period ? ++_i : --_i) {
      ma.push(void 0);
    }
    sum = target.slice(0, period).reduce(function(a, e) {
      return a + e;
    });
    current_ma = sum / period;
    ma.push(current_ma);
    for (i = _j = period, _ref = target.length; period <= _ref ? _j < _ref : _j > _ref; i = period <= _ref ? ++_j : --_j) {
      ma.push(current_ma += (target[i] - target[i - period]) / period);
    }
    if (round) {
      return this.util_round(ma);
    } else {
      return ma;
    }
  };

  Tana.prototype.EMA = function(argv) {
    var alpha, current_ema, ema, i, period, round, sum, target, _i, _j, _ref;

    if (argv === void 0) {
      argv = {
        period: 20,
        target: this.di,
        round: true
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 20;
    target = argv.hasOwnProperty('target') ? argv.target : this.di;
    round = argv.hasOwnProperty('round') ? argv.round : true;
    if (!((1 <= period && period <= target.length))) {
      return void 0;
    }
    alpha = 2 / (period + 1);
    ema = [];
    for (i = _i = 1; 1 <= period ? _i < period : _i > period; i = 1 <= period ? ++_i : --_i) {
      ema.push(void 0);
    }
    sum = target.slice(0, period).reduce(function(a, e) {
      return a + e;
    });
    current_ema = sum / period;
    ema.push(current_ema);
    for (i = _j = period, _ref = target.length; period <= _ref ? _j < _ref : _j > _ref; i = period <= _ref ? ++_j : --_j) {
      ema.push(current_ema = ema[i - 1] + alpha * (target[i] - ema[i - 1]));
    }
    if (round) {
      return this.util_round(ema);
    } else {
      return ema;
    }
  };

  Tana.prototype.MACD = function(argv) {
    var dif, ema_long, ema_period, ema_short, i, long, macd, osc, short;

    if (argv === void 0) {
      argv = {
        short: 12,
        long: 26,
        ema_period: 9
      };
    }
    short = argv.hasOwnProperty('short') ? argv.short : 12;
    long = argv.hasOwnProperty('long') ? argv.long : 26;
    ema_period = argv.hasOwnProperty('ema_period') ? argv.ema_period : 9;
    if (!(1 <= Math.min(short, long, ema_period) && Math.max(short, long, ema_period) <= this.di.length)) {
      return;
    }
    ema_short = this.util_ema({
      period: short,
      target: this.di
    });
    ema_long = this.util_ema({
      period: long,
      target: this.di
    });
    dif = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = ema_short.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (ema_short[i] !== void 0 && ema_long[i] !== void 0) {
          _results.push(ema_short[i] - ema_long[i]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    })();
    macd = this.util_ema({
      period: ema_period,
      target: dif
    });
    osc = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = ema_short.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (dif[i] !== void 0 && macd[i] !== void 0) {
          _results.push(dif[i] - macd[i]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    })();
    return {
      DIF: this.util_round(dif),
      MACD: this.util_round(macd),
      OSC: this.util_round(osc)
    };
  };

  Tana.prototype.KDJ = function(argv) {
    var d, high, i, j, k, low, period, rsv;

    if (argv === void 0) {
      argv = {
        period: 9
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 9;
    if (!((1 <= period && period <= this.di.length))) {
      return void 0;
    }
    high = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i < period - 1) {
          _results.push(void 0);
        } else {
          _results.push(this.di.slice(i - period + 1, i + 1).reduce(function(a, b) {
            return Math.max(a, b);
          }));
        }
      }
      return _results;
    }).call(this);
    low = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i < period - 1) {
          _results.push(void 0);
        } else {
          _results.push(this.di.slice(i - period + 1, i + 1).reduce(function(a, b) {
            return Math.min(a, b);
          }));
        }
      }
      return _results;
    }).call(this);
    rsv = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if ((high[i] != null) && (low[i] != null)) {
          _results.push((this.di[i] - low[i]) / (high[i] - low[i]) * 100);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    }).call(this);
    k = this.util_ema({
      period: 5,
      target: rsv
    });
    d = this.util_ema({
      period: 5,
      target: k
    });
    j = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if ((k[i] != null) && (d[i] != null)) {
          _results.push(3 * d[i] - 2 * k[i]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    }).call(this);
    return {
      K: this.util_round(k),
      D: this.util_round(d),
      J: this.util_round(j)
    };
  };

  Tana.prototype.RSI = function(argv) {
    var d, ema_d, ema_u, i, period, rsi, u;

    if (argv === void 0) {
      argv = {
        period: 10
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 10;
    if (!((1 <= period && period <= this.di.length))) {
      return void 0;
    }
    u = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i === 0) {
          _results.push(void 0);
        } else if (this.di[i] > this.di[i - 1]) {
          _results.push(this.di[i] - this.di[i - 1]);
        } else {
          _results.push(0);
        }
      }
      return _results;
    }).call(this);
    d = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i === 0) {
          _results.push(void 0);
        } else if (this.di[i] < this.di[i - 1]) {
          _results.push(this.di[i - 1] - this.di[i]);
        } else {
          _results.push(0);
        }
      }
      return _results;
    }).call(this);
    ema_u = this.util_ema({
      period: period,
      target: u
    });
    ema_d = this.util_ema({
      period: period,
      target: d
    });
    rsi = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if ((ema_u[i] != null) && (ema_d[i] != null)) {
          _results.push(ema_u[i] / (ema_u[i] + ema_d[i]) * 100);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    }).call(this);
    return this.util_round(rsi);
  };

  Tana.prototype.WR = function(argv) {
    var high, i, low, period, wr;

    if (argv === void 0) {
      argv = {
        period: 14
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 14;
    if (!((1 <= period && period <= this.di.length))) {
      return void 0;
    }
    high = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i < period - 1) {
          _results.push(void 0);
        } else {
          _results.push(this.di.slice(i - period + 1, i + 1).reduce(function(a, b) {
            return Math.max(a, b);
          }));
        }
      }
      return _results;
    }).call(this);
    low = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i < period - 1) {
          _results.push(void 0);
        } else {
          _results.push(this.di.slice(i - period + 1, i + 1).reduce(function(a, b) {
            return Math.min(a, b);
          }));
        }
      }
      return _results;
    }).call(this);
    wr = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if ((high[i] != null) && (low[i] != null)) {
          _results.push((high[i] - this.di[i]) / (high[i] - low[i]) * 100);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    }).call(this);
    return this.util_round(wr);
  };

  Tana.prototype.BIAS = function(argv) {
    var bias, ema, i, period;

    if (argv === void 0) {
      argv = {
        period: 3
      };
    }
    period = argv.hasOwnProperty('period') ? argv.period : 3;
    if (!((1 <= period && period <= this.di.length))) {
      return void 0;
    }
    ema = this.util_ema({
      period: period,
      target: this.di
    });
    bias = (function() {
      var _i, _ref, _results;

      _results = [];
      for (i = _i = 0, _ref = this.di.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if ((this.di[i] != null) && (ema[i] != null)) {
          _results.push((this.di[i] - ema[i]) / ema[i] * 100);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    }).call(this);
    return this.util_round(bias);
  };

  return Tana;

})();
