coffee-signal-slot
==================

CoffeeScript goodie, inspired by Qt's Signal-Slot system ( http://en.wikipedia.org/wiki/Signals_and_slots )

It's a convenience wrapper around the 'observer' JavaScript code found here: http://mattmueller.me/blog/underscore-extension-observer-pattern


Why to use Coffee-Signal-Slot (background story)
------------------

During the development of AppStream (http://www.goappstream.com/) I had to work mostly on MVC classes written in CoffeeScript. I've tried a lot of different methods to connect Models, Views and Controllers with each other but I wasn't satisfied with the solutions I've found. As I've done quite a lot of development with Qt for our previous project (AppWhirr) I thought a lot about the strength of Qt's Signal-Slot system which I think is really easy to use and provides enough information about the available signals (connection points) to help you when you have to use a signal (connection point).

This is why I've created this convenience CoffeeScript class, to be able to connect classes with each other in a flexible (yet easy to use) way.


How to use
------------------

You can extend your coffee class with SignalSlotCapable and you have to specify the available signals your class is able to emit.

You can also just create an object from the SignalSlotCapable class, list the available signals in an array given to the constructor.

After this you can emit any of the specified signals with optional parameters.

If you want to connect a function to a signal simply call the connectToSignal() function on the class which can emit the given signal and give it a 'slot' function to handle it.

You can connect any slot (receiver) function to a given slot.


Example
------------------

First you have to create a class and extend it with SignalSlotCapable like this one:
  class @SignalerExample extends SignalSlotCapable

Now you have to specify the names of the signals your class can emit. Usually the constructor is a great place to do it:
  @setAvailableSignals(['value-changed', 'some-other-signal'])

Now you're ready to emit your signal:
  @emitSignal('value-changed', ['im the new value'])

You can connect any observer/receiver/slot to a given slot, simple and easy:
  signaler = new SignalerExample()
  signaler.connectToSignal( 'value-changed', (please_say_this) ->
    alert(please_say_this)
  )

You can also simply create an object directly from SignalSlotCapable and provide the list of the available signals in it's constructor:
sig_slot_handler = new SignalSlotCapable( 'value-changed', 'some-other-signal' )

You can find a minimal working example in the project and you can test it by opening the 'test.html' file and a 'walk-through' style test file in the 'spec' folder.


Specs, with jasmine
------------------

You can find a spec for SignalSlotCapable in the 'spec' folder. You can test it with Jasmine ( https://jasmine.github.io/ ). It worth to check it even if you don't want to run the spec, the test is designed as a 'walk through' as well to showcase how you can use SignalSlotCapable.


Requirements
------------------

* Underscore.js
* observer.js (you can find the original code here: http://mattmueller.me/blog/underscore-extension-observer-pattern)
* and of course the SignalSlotCapable class found in coffee/signal_slot_capable.js.coffee


License
--------------------------

Simplified BSD, included in license.txt
