extends BaseSMC
class_name NormalSMC

func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	#super.spawn_teleporter(player_global_position,player_velocity)
	var teleporter_instance:Teleporter = ScenePool.teleporter.instantiate()
	teleporter_instance.global_position = global_position
	teleporter_instance.trigger_speed_scale=1.6
	get_parent().call_deferred("add_child",teleporter_instance)
