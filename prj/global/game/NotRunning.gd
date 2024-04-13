extends State

@onready var game: GlobalGame = $"../.."

func _ready() -> void:
	game.new_game_start.connect(_on_game_new_game_start)

func _on_game_new_game_start():
	transitioned.emit(self,"Running")
