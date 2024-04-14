extends Area2D
class_name Teleporter

@export var trigger_speed_scale:float=1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D
@onready var timer: Timer = $Timer
@onready var pew: AudioStreamPlayer = $Pew


@onready var can_check_player:bool=false

func _ready() -> void:
	#set_deferred("monitoring",false)
	animation_player.speed_scale=trigger_speed_scale
	animation_player.play("ticking")
	pass

func _on_ticking_end():
	can_check_player=true
	pew.play()
	animated_sprite_2d.play("disappearing")
	timer.start()
	await timer.timeout
	can_check_player=false

func _physics_process(delta: float) -> void:
	if can_check_player:
		if has_overlapping_bodies():
			for node in get_overlapping_bodies():
				if node is Player:
					var player:Player = node as Player
					player.teleported()
	if not animated_sprite_2d.is_playing():
		queue_free()
