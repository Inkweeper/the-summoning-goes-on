extends Node2D

@onready var result: RichTextLabel = $CanvasLayer/Result

func _ready() -> void:
	SoundManager.play_music_loop("res://asoundws/Song.mp3")
	result.clear()
	if Game.end_reason==1:
		result.add_text("You failed to feed yourself with enough offerings!")
	else:
		result.add_text("You're summoned by a lawbreaking capitalist and are promised to work till the end!")
	result.add_text("\n\n")
	if Game.food_record.is_empty():
		result.add_text("You're so decent that you never touched even ONE offering.\n\n")
	else :
		result.add_text("Looking back at your life, at least you did enjoy: \n\n")
		result.push_color(Color.YELLOW)
		
		var text:String=""
		for key in Game.food_record:
			text+="\t"+str(key)+" : "+str(Game.food_record[key])+"\n"
		result.add_text(text+"\n")
		result.pop()

func _on_restart_pressed() -> void:
	SceneChangerDark.change_scene("res://scenes/world/world.tscn")

func _on_back_to_title_pressed() -> void:
	SceneChangerDark.change_scene("res://scenes/starting_interface/starting_interface.tscn")
