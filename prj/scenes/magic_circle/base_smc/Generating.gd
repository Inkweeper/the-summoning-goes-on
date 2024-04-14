extends State

@export var smc:BaseSMC

func enter():
	super.enter()
	smc.generation()
	smc.animated_sprite_2d.animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	transitioned.emit(self,"Idle")
