class @People
	constructor: () ->
		@maxPop = 30
		@population = 30
		@health = 1
		# note this list is sorted by priority for unemploying
		@employed =
			total: 17
			Printing: 5
			Hydroponics: 9
			SolarStation: 3
		
	addMaxPop: (addNumber) ->
		@maxPop += addNumber
		
	addPop: (pop) ->
		retVal = true
		if pop+@population > @maxPop
			retVal = false
		else
			@population += pop
		retVal
		
	tick: () ->
		# consume food
		if window.resources['food'] < @population * @health
			window.ticker.appendValue("Not enough to eat!\n")
			window.resources['food'] = 0
			@health -= 0.01
		else
			window.resources['food'] -= @population
			if @health isnt 1 then @health += 0.01
		@adjustWorkforce()
			
	adjustWorkforce: () ->
			# if not enough to eat, we'll have to recalculate the workforce
			maxEmployed = Math.floor(@population * @health)
			if maxEmployed < @employed['total']
				# more people are employed than available, remove them based on priority
				removeLabor = @employed['total'] - maxEmployed
				for key, val of @employed
					if key is 'total' then continue
					if val > 0
						if val > removeLabor
							# we now need to disable a number of buildings to reduce labor use
							laborUse = window.buildings[key]['labor']
							buildingsDisabled = Math.ceil(removeLabor / laborUse)
							@employed[key] = val - buildingsDisabled * laborUse
							removeLabor = 0
							@employed['total'] -= buildingsDisabled * laborUse
						else
							@employed[key] = 0
							removeLabor -= val
							@employed['total'] -= val
						if removeLabor is 0 then break
					
	
	
	

