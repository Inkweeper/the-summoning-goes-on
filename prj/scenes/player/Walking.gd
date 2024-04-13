extends State

@export var player:Player

func enter():
	super.enter()
	player.animated_sprite_2d.play("walking")

func physics_update(delta:float):
	super.physics_update(delta)
	player.move(delta,1)
	player.handle_animation()
	transition_check()
	
func transition_check():
	if not player.velocity.length():
		transitioned.emit(self,"Idle")
