extends BaseSMC
class_name RandomSMC

func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	#super.spawn_teleporter(player_global_position,player_velocity)
	var teleporter_num:int=randi_range(1,6)
	for i in range(teleporter_num):
		var teleporter_instance:Teleporter = ScenePool.teleporter.instantiate()
		teleporter_instance.global_position = global_position+Vector2.RIGHT.rotated(randf_range(0,2*PI))*randf_range(0,40)
		teleporter_instance.trigger_speed_scale=1
		get_parent().call_deferred("add_child",teleporter_instance)
