extends Button
class_name UIOpenRouteButton

@export var router : UIRouter
@export var route_name : String

func _ready():
	self.pressed.connect(on_pressed)

func on_pressed():
	router.open_route(route_name)
	
