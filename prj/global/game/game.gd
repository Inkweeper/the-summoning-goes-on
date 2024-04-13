extends Node
class_name GlobalGame

signal new_game_start
signal game_over(Reason:int) # 1:饿死 2:传送走了

signal starved_to_death
signal teleported_away


var food_record:Dictionary={
	
}

var time_record:float

var satiety:float=50:
	set(v):
		satiety=clampf(v,0,100)
		if satiety==0:
			starved_to_death.emit()

func new_game():
	food_record.clear()
	time_record = 0
	satiety=50

func game_physics_tick(delta:float):
	time_record+=delta
	satiety-=delta*4
	
	

