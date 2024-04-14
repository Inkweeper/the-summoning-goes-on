extends State

@export var player:Player

func enter():
	super.enter()
	SoundManager.play_music("res://asoundws/game_over.mp3")
	Game.satiety_can_decrease=false
	player.animated_sprite_2d.hide()
	var timer=get_tree().create_timer(3)
	await timer.timeout
	Game.game_over.emit(2)
