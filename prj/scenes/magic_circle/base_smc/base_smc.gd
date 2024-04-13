extends Area2D
class_name BaseSMC

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	monitoring=false
	pass

func generation():
	monitoring=false
	if animated_sprite_2d.sprite_frames.has_animation("generating"):
		animated_sprite_2d.play("generating")

func boot():
	if animated_sprite_2d.sprite_frames.has_animation("idle"):
		animated_sprite_2d.play("idle")
	monitoring = true
	spawn_offering()

func spawn_offering():
	
	pass

func triggered():
	monitoring = false
	if animation_player.has_animation("triggered"):
		animation_player.play("triggered")
	spawn_teleporter()
	pass

func spawn_teleporter():
	
	pass
