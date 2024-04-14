extends BaseSMC
class_name ChaserSMC

func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	#super.spawn_teleporter(player_global_position,player_velocity)
	Game.chaser_activate(get_parent())
