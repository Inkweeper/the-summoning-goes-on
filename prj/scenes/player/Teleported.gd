extends State

@export var player:Player

func enter():
	super.enter()
	player.animated_sprite_2d.hide()
	var timer=get_tree().create_timer(2)
	await timer.timeout
	Game.game_over.emit(2)
