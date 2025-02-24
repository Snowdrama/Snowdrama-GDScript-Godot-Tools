extends Node
class_name UIRoute

@export var router : UIRouter
@export var route_name : String
@export var route_content : Control
@export var start_open : bool = false
var route_open : bool

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	if start_open:
		open_route()
	else:
		close_route()
	
func _enter_tree():
	router.register_route(self)
	
func _exit_tree():
	router.unregister_route(self)

func open_route():
	route_open = true
	route_content.visible = true
	
func close_route():
	route_open = false
	route_content.visible = false
	
func set_rout_state(state : bool):
	route_open = state
	route_content.visible = state
	
func toggle_route():
	route_open = !route_open
	route_content.visible = route_open
