class @TurnHandler
	constructor: () ->
		this.setTickInterval(1000)
					
	setTickInterval: (interval) ->
		callback = @tick.bind @
		setInterval(callback, interval)
		
	tick: () ->
		window.buildingManager?.tick()
		window.peopleManager?.tick()
		window.ticker.appendValue("Update: b#{window.resources['block']}, lm#{window.resources['lightMachinery']}, f#{window.resources['food']}, o#{window.resources['ore']}, p#{window.resources['power']} || WF#{window.peopleManager.employed['total']}, H#{window.peopleManager.health} ||PR#{window.peopleManager.employed['Printing']}, H#{window.peopleManager.employed['Hydroponics']}, S#{window.peopleManager.employed['SolarStation']}\n")

