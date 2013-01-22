#= require utils/observer

class @SignalSlotCapable

  constructor: ->
    @available_signals = []

  isSignalAvailable: (name_of_signal) ->
    return name_of_signal in @available_signals

  # 
  # defines/sets the available signals which can be then emitted and slots can be connected to
  setAvailableSignals: (available_signals_array) ->
    @available_signals = available_signals_array

  #
  # connect a given \a slot_method method to the signal selected by the \a name_of_signal parameter
  connectToSignal: (name_of_signal, slot_method) ->
    if @isSignalAvailable( name_of_signal )
      _(@).on( name_of_signal, slot_method )
    else
      console.log('connectToSignal#singnal is not available - available signals: ')
      for available_signal in @available_signals
        do (available_signal) ->
          console.log( available_signal )
      alert('singnal is not available: ' + name_of_signal)

  #
  # disconnect the given \a name_of_signal
  # disconnectFromSignal: (name_of_signal) ->


  # 
  # emits the given signal if it's available
  #   @param signal_params_array_or_null : an array (it has to be an array!!) of parameters or null if you don't want to define parameters for the emitted signal
  emitSignal: (name_of_signal, signal_params_or_null = null) ->
    if @isSignalAvailable( name_of_signal )
      if signal_params_or_null?
        _(@).emit(name_of_signal, signal_params_or_null)
      else
        _(@).emit(name_of_signal)
    else
      console.log('emitSignal#singnal is not available - available signals: ' + @available_signals)
      for available_signal in @available_signals
        do (available_signal) ->
          console.log( available_signal )
      alert('singnal is not available: ' + name_of_signal)
