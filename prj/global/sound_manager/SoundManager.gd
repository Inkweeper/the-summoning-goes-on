extends Node

@onready var bgm_player = $BGMPlayer
var play_once:bool=false

func _ready() -> void:
	play_music_loop("res://asoundws/Song.mp3")

func play_music(path : String):
	play_once=true
	if bgm_player.playing and bgm_player.stream.resource_path == path:
		return
	bgm_player.stream = load(path)
	bgm_player.play()

func play_music_loop(path:String):
	play_once=false
	if bgm_player.playing and bgm_player.stream.resource_path == path:
		return
	bgm_player.stream = load(path)
	bgm_player.play()

func _on_bgm_player_finished() -> void:
	if play_once:
		return
	else:
		bgm_player.play()
