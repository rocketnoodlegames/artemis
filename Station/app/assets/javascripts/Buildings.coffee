window.buildings = 
	Printing:
		buildCost:
			block: 25
			lightMachinery: 1
		operateCost:
			ore: 5
			power: 4
		labor: 5
		produces:
			block: 1
	Hydroponics:
		buildCost:
			block: 5
		operateCost:
			power: 1
		labor: 3
		produces:
			food: 20
	SolarStation:
		buildCost:
			block: 20
		labor: 1
		produces:
			power: 8
	Housing:
		buildCost:
			block: 12
		operateCost:
			power: 1
		produces:
			housing: 6

class @BuildingManager
	constructor: () ->
		@built = 
			Printing: 1
			Hydroponics: 3
			SolarStation: 3
			Housing: 5
		
	addBuilding: (buildingType, buildingAmount) ->
		if @sufficientResources(buildingType, buildingAmount)
			for key, val of window.buildings[buildingType]['buildCost']
				window.resources[key] -= val * buildingAmount
				
			if @built[buildingType]? 
				@built[buildingType] += buildingAmount
			else
				@built[buildingType] = buildingAmount
				
	sufficientResources: (buildingType, buildingAmount) ->
		result = true
		for key, val of window.buildings[buildingType]['buildCost']
			if (window.resources[key] < buildingAmount * val)
				result = false
				window.ticker.appendValue('\nNot enough resources\n')
		result
		
	tick: () ->
		# go through all the buildings, see if they have enough resources
		for buildingName, buildingCount of window.buildings
			sufficient = true
			for resourceName, resourceReq of window.buildings[buildingName]['operateCost']
				if window.resources[resourceName] < resourceReq
					sufficient = false
					window.ticker.appendValue("\nNot enough resources: #{resourceName}")
			if sufficient
				# subtract the resource requirement
				for resourceName, resourceReq of window.buildings[buildingName]['operateCost']
					window.resources[resourceName] -= resourceReq
				# reward the resources
				for resourceName, resourceReward of window.buildings[buildingName]['produces']
					window.resources[resourceName] += resourceReward
	
	status: () ->
		window.ticker.appendValue('\nI have ' + @built['Printing'] + 'printers ' + @built['Hydroponics'] + 'hydros, ' + @built['SolarStation'] + 'solars ' + @built['Housing'] + 'housing\n')