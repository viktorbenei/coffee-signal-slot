// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.SignalerExample = (function(_super) {

    __extends(SignalerExample, _super);

    function SignalerExample(content_filter_view_container_element) {
      this.setAvailableSignals(['value-changed']);
      this.available_values = ['Hi!', "I'm", 'an example', 'value', 'signaled.'];
      this.curr_value_idx = 0;
    }

    SignalerExample.prototype.emitSomething = function() {
      var say_this;
      say_this = this.available_values[this.curr_value_idx];
      ++this.curr_value_idx;
      if (this.curr_value_idx >= this.available_values.length) {
        this.curr_value_idx = 0;
      }
      return this.emitSignal('value-changed', [say_this]);
    };

    return SignalerExample;

  })(SignalSlotCapable);

}).call(this);
