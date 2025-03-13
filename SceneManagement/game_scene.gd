extends Node
class_name GameScene
func _ready():
	print("Gamne Scene Ready: ", self.name)
	ToolsMessages.scene_management.set_scene_as_current.emit(self)
