extends Node

var last_paused_state : bool = false
var tree : SceneTree 

@export var paused_song:String

func _ready():
	tree = get_tree()

func _process(delta):
	if tree.paused != last_paused_state:
		last_paused_state = tree.paused
		if last_paused_state:
			ToolsMessages.audio.request_override_song.emit(paused_song)
		else:
			ToolsMessages.audio.clear_override_song.emit()
				
