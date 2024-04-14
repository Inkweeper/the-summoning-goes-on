extends Node
class_name GlobalScenePool

var smcs:Array=[
	preload("res://scenes/magic_circle/normal_smc/normal_smc.tscn"),
	preload("res://scenes/magic_circle/circular_array_smc/circular_array_smc.tscn"),
	preload("res://scenes/magic_circle/predictor_smc/predictor_smc.tscn"),
	preload("res://scenes/magic_circle/chaser_smc/chaser_smc.tscn"),
	preload("res://scenes/magic_circle/random_smc/random_smc.tscn")
]

var normal_offerings:Array=[
	preload("res://scenes/offering/offerings/burger.tscn"),
	preload("res://scenes/offering/offerings/cheese.tscn"),
	preload("res://scenes/offering/offerings/cherry.tscn")
]

var special_offerings:Array=[
	
]

var teleporter:PackedScene=preload("res://scenes/teleporter/teleporter.tscn")


