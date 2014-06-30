class @Ticker
	constructor: () ->
		this.setTickInterval(1000)
					
	setTickInterval: (interval) ->
		callback = @tick.bind @
		setInterval(callback, interval)
		
	tick: () ->
		window.buildingManager?.tick()
		@appendValue("Update: block#{window.resources['block']}, lightMachinery#{window.resources['lightMachinery']}, food#{window.resources['food']}, ore#{window.resources['ore']}, power#{window.resources['power']}\n")
		
	alerter: () ->
		alert 'test complete'

	appendValue: (inVal) ->
		content = document.getElementById('testArea')
		content.value = content.value + inVal

$(document).ready ->
	window.ticker = new Ticker()
	#window.ticker.appendValue('hello!' + 10/11)
	window.resources =
		block: 10
		lightMachinery: 1
		food: 1000
		power: 1000
		ore: 20
	window.buildingManager = new BuildingManager()
	
	