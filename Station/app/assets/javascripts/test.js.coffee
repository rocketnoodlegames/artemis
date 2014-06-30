class @Ticker
	constructor: () ->
		this.setTickInterval(1000)
		this.appendValue ('hi')
					
	setTickInterval: (interval) ->
		callback = @tick.bind @
		setInterval(callback, interval)
		
	tick: () ->
		this.appendValue('test')
		
	alerter: () ->
		alert 'test complete'

	appendValue: (inVal) ->
		content = document.getElementById('testArea')
		content.value = content.value + inVal

$(document).ready ->
	window.ticker = new Ticker()
	window.ticker.appendValue('hello!')
	window.resources =
		block: 10
		lightMachinery: 1
	window.buildingManager = new BuildingManager()
	window.buildingManager.status()
	window.ticker.appendValue('stuff ' + window.resources.block + ' || ' + window.resources.lightMachinery)
	window.buildingManager.addBuilding('Hydroponics', 2)
	window.buildingManager.status()
	window.ticker.appendValue('stuff ' + window.resources.block + ' || ' + window.resources.lightMachinery)
	window.buildingManager.addBuilding('Hydroponics', 2)
	window.buildingManager.status()
	window.ticker.appendValue('stuff ' + window.resources.block + ' || ' + window.resources.lightMachinery)
	
	