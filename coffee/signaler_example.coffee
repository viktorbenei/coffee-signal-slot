class @SignalerExample extends SignalSlotCapable

  constructor: (content_filter_view_container_element) ->
    @setAvailableSignals([
      'value-changed'
    ])
    @available_values = ['Hi!', "I'm", 'an example', 'value', 'signaled.']
    @curr_value_idx = 0

  emitSomething: ->
    say_this = @available_values[@curr_value_idx]
    ++@curr_value_idx
    if @curr_value_idx >= @available_values.length
      @curr_value_idx = 0

    @emitSignal('value-changed', [say_this])