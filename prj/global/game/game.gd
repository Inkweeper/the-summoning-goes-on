extends Node
class_name GlobalGame

signal new_game_start
signal game_over(reason:int) # 1:饿死 2:传送走了

signal starved_to_death
signal teleported_away

signal offering_collected(type_name:String,satiety_recover:float)

var food_record:Dictionary={
	
}

var time_record:float
var eraser_record:int

var satiety:float=50:
	set(v):
		satiety=clampf(v,0,100)
		if satiety==0:
			starved_to_death.emit()

var satiety_decrease:float=1
var satiety_can_decrease:bool=false

var end_reason:int=0

func _ready() -> void:
	offering_collected.connect(_on_offering_collected)
	game_over.connect(_on_game_over)

func new_game():
	SoundManager.play_music_loop("res://asoundws/Song.mp3")
	food_record.clear()
	time_record = 0
	eraser_record=0
	satiety=50
	satiety_decrease=1
	satiety_can_decrease=true
	end_reason=0

func game_physics_tick(delta:float):
	if satiety_can_decrease:
		time_record+=delta
		satiety-=delta*satiety_decrease
		satiety_decrease+=delta/5
	
func _on_offering_collected(type_name:String,satiety_recovered:float):
	if type_name != "__":
		if food_record.has(type_name):
			food_record[type_name]+=1
		else:
			food_record[type_name]=1
		satiety+=satiety_recovered
	else:
		eraser_record+=1

func _on_game_over(reason:int):
	end_reason=reason
	SceneChangerDark.change_scene("res://scenes/ending_interface/ending_interface.tscn")

func chaser_activate(node:Node):
	for i in range(3):
		var player=get_tree().get_first_node_in_group("player")
		var teleporter_instance:Teleporter = ScenePool.teleporter.instantiate()
		teleporter_instance.global_position = player.global_position
		teleporter_instance.trigger_speed_scale=1.2
		node.call_deferred("add_child",teleporter_instance)
		var timer=get_tree().create_timer(0.7)
		await timer.timeout

