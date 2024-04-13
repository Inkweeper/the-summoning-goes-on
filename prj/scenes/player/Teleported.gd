extends State

@export var player:Player

func enter():
	super.enter()
	player.animated_sprite_2d.hide()
