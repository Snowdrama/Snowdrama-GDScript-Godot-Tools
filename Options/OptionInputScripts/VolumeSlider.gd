extends Slider
class_name VolumeSlider
@export var option_key : String

func _ready():
	self.value_changed.connect(slider_value_changed)
	self.set_value_no_signal(Options.get_float(option_key))
	ToolsMessages.audio.set_mixer_target_value.emit(option_key, value)
	
func slider_value_changed(value):
	Options.set_float(option_key, value)
	ToolsMessages.audio.set_mixer_target_value.emit(option_key, value)
