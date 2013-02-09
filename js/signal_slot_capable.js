// Generated by CoffeeScript 1.3.3
(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  this.SignalSlotCapable = (function() {

    function SignalSlotCapable(available_signals) {
      this.available_signals = available_signals != null ? available_signals : [];
    }

    SignalSlotCapable.prototype.isSignalAvailable = function(name_of_signal) {
      return __indexOf.call(this.available_signals, name_of_signal) >= 0;
    };

    SignalSlotCapable.prototype.setAvailableSignals = function(available_signals_array) {
      return this.available_signals = available_signals_array;
    };

    SignalSlotCapable.prototype.connectToSignal = function(name_of_signal, slot_method) {
      var available_signal, _fn, _i, _len, _ref;
      if (this.isSignalAvailable(name_of_signal)) {
        return _(this).on(name_of_signal, slot_method);
      } else {
        console.log('connectToSignal#singnal is not available - available signals: ');
        _ref = this.available_signals;
        _fn = function(available_signal) {
          return console.log(available_signal);
        };
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          available_signal = _ref[_i];
          _fn(available_signal);
        }
        return alert('singnal is not available: ' + name_of_signal);
      }
    };

    SignalSlotCapable.prototype.emitSignal = function(name_of_signal, signal_params_or_null) {
      var available_signal, _fn, _i, _len, _ref;
      if (signal_params_or_null == null) {
        signal_params_or_null = null;
      }
      if (this.isSignalAvailable(name_of_signal)) {
        if (signal_params_or_null != null) {
          return _(this).emit(name_of_signal, signal_params_or_null);
        } else {
          return _(this).emit(name_of_signal);
        }
      } else {
        console.log('emitSignal#singnal is not available - available signals: ' + this.available_signals);
        _ref = this.available_signals;
        _fn = function(available_signal) {
          return console.log(available_signal);
        };
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          available_signal = _ref[_i];
          _fn(available_signal);
        }
        return alert('singnal is not available: ' + name_of_signal);
      }
    };

    return SignalSlotCapable;

  })();

}).call(this);
