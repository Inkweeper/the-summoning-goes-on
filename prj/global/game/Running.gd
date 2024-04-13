extends State

@onready var game: GlobalGame = $"../.."

func _ready() -> void:
	game.game_over.connect(_on_game_game_over)

func enter():
	super.enter()
	game.new_game()

func physics_update(delta:float):
	super.physics_update(delta)
	game.game_physics_tick(delta)

func _on_game_game_over():
	transitioned.emit(self,"NotRunning")
