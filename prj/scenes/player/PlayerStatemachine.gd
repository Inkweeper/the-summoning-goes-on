extends Statemachine

@export var player:Player

func _ready() -> void:
	super._ready()
	player.player_dying.connect(_on_player_dying)
	player.player_teleported.connect(_on_player_teleported)

func _on_player_dying():
	if currentState != states["Dying"] and currentState != states["Teleported"]:
		_on_child_transitioned(currentState,"Dying")

func _on_player_teleported():
	if currentState != states["Dying"] and currentState != states["Teleported"]:
		_on_child_transitioned(currentState,"Teleported")
