class @Ticker
	constructor: () ->
		this.setTickInterval(1000)
					
	setTickInterval: (interval) ->
		callback = @tick.bind @
		setInterval(callback, interval)
		
	tick: () ->
		window.buildingManager?.tick()
		window.peopleManager?.tick()
		@appendValue("Update: b#{window.resources['block']}, lm#{window.resources['lightMachinery']}, f#{window.resources['food']}, o#{window.resources['ore']}, p#{window.resources['power']} || WF#{window.peopleManager.employed['total']}, H#{window.peopleManager.health} ||PR#{window.peopleManager.employed['Printing']}, H#{window.peopleManager.employed['Hydroponics']}, S#{window.peopleManager.employed['SolarStation']}\n")
		
	alerter: () ->
		alert 'test complete'

	appendValue: (inVal) ->
		content = document.getElementById('testArea')
		content.value = content.value + inVal

$(document).ready ->
	window.ticker = new Ticker()
	#window.ticker.appendValue('hello!' + Math.min(10,1))
	window.resources =
		block: 10
		lightMachinery: 1
		food: 40
		power: 800
		ore: 1000
	window.buildingManager = new BuildingManager()
	window.peopleManager = new People()
	#alert("hiyo: " + Object.keys(window.resources) + "||" + window.resources['power'])
	