extends CharacterBody2D
class_name Player

signal player_dying
signal player_teleported

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var acc:float = 800
@export var friction:float = 500
@export var air_friction_para:float=0.01

func move(delta:float,v_para:float) -> void:
	velocity += Vector2(Input.get_axis("a","d"),Input.get_axis("w","s")).normalized()*v_para*acc*delta
	velocity = velocity.move_toward(Vector2.ZERO,(friction+air_friction_para*pow(velocity.length(),2))*delta)
	move_and_slide()

func handle_animation():
	if velocity.x>0:
		animated_sprite_2d.flip_h=false
	elif velocity.x<0:
		animated_sprite_2d.flip_h=true
	animated_sprite_2d.speed_scale = velocity.length()/80

func starved_to_death():
	player_dying.emit()

func teleported():
	player_teleported.emit()

