extends Area2D
class_name BaseSMC

signal spawn_offering_request(spawning_global_position:Vector2)

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	set_deferred("monitoring",false)
	body_entered.connect(_on_body_entered)
	pass

func generation():
	set_deferred("monitoring",false)
	if animated_sprite_2d.sprite_frames.has_animation("generating"):
		animated_sprite_2d.play("generating")

func boot():
	if animated_sprite_2d.sprite_frames.has_animation("idle"):
		animated_sprite_2d.play("idle")
	set_deferred("monitoring",true)
	spawn_offering()

func _on_body_entered(body):
	if body is Player:
		triggered(body.global_position,body.velocity)

func triggered(player_global_position:Vector2,player_velocity:Vector2):
	set_deferred("monitoring",false)
	if animation_player.has_animation("triggered"):
		animation_player.play("triggered")
	spawn_teleporter(player_global_position,player_velocity)
	pass

func spawn_offering():
	spawn_offering_request.emit(global_position)
	pass

func deferred_queue_free():
	#print("A SMC is removed")
	call_deferred("queue_free")

## spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2)
func spawn_teleporter(player_global_position:Vector2,player_velocity:Vector2):
	
	pass
