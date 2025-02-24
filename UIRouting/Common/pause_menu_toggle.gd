extends Node

@export var router : UIRouter

#the action that pauses the game
@export var action_name : String = "pause"
#the route to open
@export var route_name : String = "pause"

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed(action_name):
		if router.open_route_count() == 0:
			router.open_route(route_name)
		else:
			router.close_all()
			
	if router.open_route_count() > 0 && !get_tree().paused:
		get_tree().paused = true
	elif router.open_route_count() == 0 && get_tree().paused:
		get_tree().paused = false

func _enter_tree():
	pass

func _exit_tree():
	#if we leave the tree unpause if paused
	get_tree().paused = false
