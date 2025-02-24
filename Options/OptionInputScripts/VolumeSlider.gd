extends Slider
class_name VolumeSlider
@export var option_key : AudioMixer.VolumeKeyType

func _ready():
	self.value_changed.connect(slider_value_changed)
	self.set_value_no_signal(Options.get_float(AudioMixer.VOLUME_KEYS[option_key]))
	MessageSystemExample.audio.set_mixer_value.emit(AudioMixer.VOLUME_KEYS[option_key], value)
	
func slider_value_changed(value):
	Options.set_float(AudioMixer.VOLUME_KEYS[option_key], value)
	MessageSystemExample.audio.set_mixer_value.emit(AudioMixer.VOLUME_KEYS[option_key], value)
