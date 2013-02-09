describe 'SignalSlotCapable', ->

  describe 'initialize', ->

    it 'should accept 0 params in its constructor and be valid', ->
      ssc = new SignalSlotCapable()
      expect(ssc).not.toBe null
      expect(ssc).not.toBeUndefined()
      expect(ssc).toEqual(jasmine.any(SignalSlotCapable))

    it 'should accept an array of available signals and be valid', ->
      ssc = new SignalSlotCapable(['a', 'b'])
      expect(ssc).not.toBe null
      expect(ssc).not.toBeUndefined()
      expect(ssc).toEqual(jasmine.any(SignalSlotCapable))

  describe 'signals and slots', ->

    it 'should be able to connect to a given signal and the slot should be called upon emit of the signal', ->
      ssc = new SignalSlotCapable(['a'])
      this_should_be_true = false
      # connect
      ssc.connectToSignal( 'a', () =>
        this_should_be_true = true
      )
      # emit
      ssc.emitSignal( 'a' )
      expect( this_should_be_true ).toBe true

    it 'should be able to handle multiple slots connected to the same signal', ->
      ssc = new SignalSlotCapable( ['a', 'b'] )
      var_one = false
      var_two = false
      # connect
      ssc.connectToSignal( 'a', () =>
        var_one = true
      )
      ssc.connectToSignal( 'a', () =>
        var_two = true
      )
      # emit
      ssc.emitSignal( 'a' )
      # expect
      expect(  var_one ).toBe true
      expect(  var_two ).toBe true

    it 'should be able to send parameters for slots', ->
      ssc = new SignalSlotCapable( ['one', 'two'] )
      var_one = 0
      var_two = 0
      # connect
      ssc.connectToSignal( 'one', (param) =>
        var_one = param
      )
      ssc.connectToSignal( 'two', (param) =>
        var_two = param
      )
      # emit
      ssc.emitSignal( 'one', [1] )
      ssc.emitSignal( 'two', [2] )
      # expect
      expect( var_one ).toBe 1
      expect( var_two ).toBe 2

    it 'should be able to send more than one parameter for its slot', ->
      ssc = new SignalSlotCapable( ['a'] )
      var_one = 0
      var_two = 0
      # connect
      ssc.connectToSignal( 'a', (param_one, param_two) =>
        var_one = param_one
        var_two = param_two
      )
      # emit
      ssc.emitSignal( 'a', ['one', 2] )
      # expect
      expect( var_one ).toBe 'one'
      expect( var_two ).toBe 2

  describe 'inherit a class from SignalSlotCapable', ->

    it 'should work with an inherited class', ->
      # test class, inherited from SignalSlotCapable
      #  will emit 'val-changed' signal if the test_val changes
      class MySignaler extends SignalSlotCapable
        constructor: ->
          @setAvailableSignals([
            'val-changed'
          ])
          @test_val = 0
        setTestVal: (to_val) ->
          @test_val = to_val
          @emitSignal( 'val-changed', [@test_val] )
      my_signaler = new MySignaler()
      val_one = 0
      # connect
      my_signaler.connectToSignal( 'val-changed', (new_val) =>
        val_one = new_val
      )
      # set - and emit
      my_signaler.setTestVal( 'this val' )
      # expect
      expect( val_one ).toBe 'this val'

