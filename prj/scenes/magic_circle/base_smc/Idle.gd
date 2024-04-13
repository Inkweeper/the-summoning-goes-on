extends State

@export var smc:BaseSMC

func enter():
	super.enter()
	smc.boot()
