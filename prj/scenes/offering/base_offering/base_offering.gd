extends Area2D
class_name BaseOffering

@export_enum(
	"burger",
	"cheese",
	"cherry",
	"__"
)var offering_type_name:String

@export var satiety_recovery:float

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D


func _ready() -> void:
	if animation_player.has_animation("generating"):
		animation_player.play("generating")
	body_entered.connect(_on_body_entered)
	cpu_particles_2d.finished.connect(_on_particles_finished)
	pass

func _on_body_entered(body):
	if body is Player:
		var player=body as Player
		player.eat()
		animated_sprite_2d.set("self_modulate",Color(1,1,1,0))
		set_deferred("monitoring",false)
		cpu_particles_2d.set_deferred("emitting",true)
		Game.offering_collected.emit(offering_type_name,satiety_recovery)

func _on_particles_finished():
	queue_free()
