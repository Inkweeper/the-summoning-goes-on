extends Node2D
class_name ItemGenerator

@onready var smc_layer: Node2D = $SmcLayer
@onready var offering_layer: Node2D = $OfferingLayer
@onready var timer: Timer = $Timer


func _ready() -> void:
	smc_layer.child_entered_tree.connect(_on_smc_enter_tree)
	timer.timeout.connect(_on_timer_timeout)

	# test code:测试召唤法阵=>食物=>传送器生成是否通畅
	#var timer=get_tree().create_timer(1.5)
	#await timer.timeout
	#var test_smc_scene:PackedScene=ScenePool.smcs[0]
	#var test_smc_scene_instance:BaseSMC=test_smc_scene.instantiate()
	#test_smc_scene_instance.global_position=Vector2(200,200)
	#smc_layer.add_child(test_smc_scene_instance)
	#
	pass

func spawn_smc():
	var pos_to_spawn:Vector2=Vector2(randf_range(18,382),randf_range(18,282))
	var index:int=randi()%ScenePool.smcs.size()
	var smc:PackedScene = ScenePool.smcs[index]
	var smc_instance:BaseSMC= smc.instantiate()
	smc_instance.global_position = pos_to_spawn
	smc_layer.add_child(smc_instance)

func _on_smc_enter_tree(node):
	if node is BaseSMC:
		var smc = node as BaseSMC
		smc.spawn_offering_request.connect(_on_smc_request_spawn_offering)

func _on_smc_request_spawn_offering(pos:Vector2):
	var index:int=randi()%ScenePool.normal_offerings.size()
	var offering:PackedScene = ScenePool.normal_offerings[index]
	var offering_instance:BaseOffering= offering.instantiate()
	offering_instance.global_position = pos
	offering_layer.add_child(offering_instance)


func _on_timer_timeout():
	spawn_smc()
	var time_temp:float=clampf(lerpf(timer.wait_time,0,0.02),0.3,1)
	timer.wait_time=time_temp
	timer.start()
	pass
