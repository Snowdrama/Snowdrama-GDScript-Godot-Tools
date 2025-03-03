extends Node
class_name AudioMixer

const MASTER_VOLUME_KEY : String = "Master"
const MUSIC_VOLUME_KEY : String = "Music"
const SOUNDS_VOLUME_KEY : String = "Sounds"
const VOICE_VOLUME_KEY : String = "Voices"

@export var mixer_channel_names : Array[String] = [
	"Master",
	"Music",
	"Sounds",
	"Voices",
]

var volume_targets : Dictionary[String, float] = {}

var lerp_speed = 1.0

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	pass

func _process(delta):
	for mixer_channel_name : String in mixer_channel_names:
		var current = get_mixer_value(mixer_channel_name)
		var new_volume = move_toward(current, volume_targets[mixer_channel_name], delta * lerp_speed)
		set_mixer_value(
			mixer_channel_name, 
			new_volume
		)
	pass

func _enter_tree():
	for mixer_channel_name : String in mixer_channel_names:
		volume_targets.set(
			mixer_channel_name, 
			Options.get_float(mixer_channel_name, 1.0))
		set_mixer_value(
			mixer_channel_name, 
			0)
	ToolsMessages.audio.set_mixer_target_value.connect(set_mixer_target_value)
	ToolsMessages.audio.set_mixer_value.connect(set_mixer_value)
	
func _exit_tree():
	ToolsMessages.audio.set_mixer_target_value.disconnect(set_mixer_target_value)
	ToolsMessages.audio.set_mixer_value.disconnect(set_mixer_value)
	
	
	

func get_mixer_value(mixer_channel:String) -> float:
	var index = AudioServer.get_bus_index(mixer_channel)
	var value_in_db = AudioServer.get_bus_volume_db(index)
	var value = db_to_linear(value_in_db)
	return value
	
func set_mixer_target_value(mixer_channel:String, value : float):
	Options.set_float(mixer_channel, value)
	print("Setting Target ", mixer_channel, " to ", value)
	volume_targets[mixer_channel] = value
	
func set_mixer_value(mixer_channel:String, value : float):
	var index = AudioServer.get_bus_index(mixer_channel)
	if index != -1:
		var value_in_db = linear_to_db(value)
		AudioServer.set_bus_volume_db(index, value_in_db)
	pass
	
