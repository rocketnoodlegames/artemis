class @Ticker	
	alerter: () ->
		alert 'test complete'

	appendValue: (inVal) ->
		content = document.getElementById('testArea')
		content.value = content.value + inVal
	
$(document).ready ->
	window.ticker = new Ticker()
	window.turnHandler = new TurnHandler()
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
	