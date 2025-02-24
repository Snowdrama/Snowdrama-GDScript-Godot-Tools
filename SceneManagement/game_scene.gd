extends Node
class_name GameScene
func _ready():
	ToolsMessages.scene_management.set_scene_as_current.emit(self)
