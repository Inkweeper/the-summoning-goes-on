extends State

@export var player:Player

func enter():
	super.enter()
	player.animated_sprite_2d.play("default")

func physics_update(delta:float):
	super.physics_update(delta)
	player.move(delta,1)
	transition_check()
	
func transition_check():
	if player.velocity.length():
		transitioned.emit(self,"Walking")
