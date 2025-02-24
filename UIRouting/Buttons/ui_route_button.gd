extends Node
class_name UIRouteButton

# Assigned by parent route, if not child of route it won't work!
@export var router : UIRouter

func _ready():
	self.pressed.connect(on_pressed)

# THIS NEEDS TO BE IMPLEMENTED IN YOUR BUTTON!
func on_pressed():
	pass
