extends State

@export var smc:BaseSMC

func _ready() -> void:
	smc.animated_sprite_2d.animation_finished.connect(_on_animation_finished)

func enter():
	super.enter()
	smc.generation()

func _on_animation_finished():
	transitioned.emit(self,"Idle")
