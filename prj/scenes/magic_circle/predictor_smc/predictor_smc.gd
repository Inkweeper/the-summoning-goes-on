extends BaseSMC
class_name PredictorSMC

func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	#super.spawn_teleporter(player_global_position,player_velocity)
	for i in range(3):
		var teleporter_instance:Teleporter = ScenePool.teleporter.instantiate()
		teleporter_instance.global_position = player_global_position+(0.7/1.7)*player_velocity.rotated(-PI/12+PI/12*i)
		teleporter_instance.trigger_speed_scale=1.7
		get_parent().call_deferred("add_child",teleporter_instance)
