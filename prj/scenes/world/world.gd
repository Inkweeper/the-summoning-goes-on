extends Node2D
class_name World

func _ready() -> void:
	Game.new_game_start.emit()
	Game.new_game()

