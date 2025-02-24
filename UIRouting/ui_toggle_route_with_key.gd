extends Node

@export var router : UIRouter

@export var action_name : String = "pause"
@export var route_name : String = "pause"

func _process(delta):
	if Input.is_action_just_pressed(action_name):
		router.toggle_route(route_name)
