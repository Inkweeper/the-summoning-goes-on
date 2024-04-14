extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("start")

func goto_world():
	SceneChangerDark.change_scene("res://scenes/world/world.tscn")

func _on_button_pressed() -> void:
	if not animation_player.is_playing():
		animation_player.play("game_start")
