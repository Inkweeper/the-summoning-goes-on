extends BaseSMC
class_name CircularArraySMC

func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	#super.spawn_teleporter(player_global_position,player_velocity)
	for i in range(8):
		var teleporter_instance:Teleporter = ScenePool.teleporter.instantiate()
		teleporter_instance.global_position = global_position+Vector2.RIGHT.rotated(2*PI/8*i)*34
		teleporter_instance.trigger_speed_scale=2
		get_parent().call_deferred("add_child",teleporter_instance)
