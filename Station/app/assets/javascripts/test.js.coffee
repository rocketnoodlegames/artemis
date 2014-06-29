class @Ticker
	constructor: () ->
		this.setTickInterval(1000)
		this.appendValue ('hi')
		alert 'test 2'
					
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
	@ticker = new Ticker()
	@ticker.appendValue('hello!')
	