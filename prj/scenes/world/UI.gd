extends CanvasLayer

@onready var satiety_progress_bar: ProgressBar = $SatietyProgressBar

func _physics_process(delta: float) -> void:
	satiety_progress_bar.value = Game.satiety
