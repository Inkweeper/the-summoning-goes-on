extends Node
class_name Statemachine

@export var currentState : State

var states: Dictionary = {}

## 将所有state录入stateMachine
func _ready():
	for child in get_children():
		if child is State:
			child.stateMachine = self
			states[child.name] = child
			# 将变更state请求信号连接到变更state函数上
			child.transitioned.connect(_on_child_transitioned)
	await get_parent().ready
	currentState.enter()

## 下面两个函数是指在每帧和每个物理刻进行当前state该做的事
func _process(delta):
	if currentState:
		currentState.update(delta)

func _physics_process(delta):
	if currentState:
		currentState.physics_update(delta)

## 该函数用于在改变state时触发前一个state的exit()以及后一个state的enter()
func _on_child_transitioned(state:State,newStateName:String):
	if state != currentState: 
		return
	var newState :State = states.get(newStateName)
	if !newState: 
		return
	
	if currentState:
		currentState.exit()
		
	newState.enter()
	
	currentState = newState
