extends Node
class_name AudioMixer

const MASTER_VOLUME_KEY : String = "Master"
const MUSIC_VOLUME_KEY : String = "Music"
const SOUNDS_VOLUME_KEY : String = "Sounds"
const VOICE_VOLUME_KEY : String = "Voices"

enum VolumeKeyType {
	MasterVolumeKey,
	MusicVolumeKey,
	SoundVolumeKey,
	VoiceVolumeKey,
}
const VOLUME_KEYS : Dictionary[VolumeKeyType, String] = {
	VolumeKeyType.MasterVolumeKey : "Master",
	VolumeKeyType.MusicVolumeKey : "Music",
	VolumeKeyType.SoundVolumeKey : "Sounds",
	VolumeKeyType.VoiceVolumeKey : "Voices",
}

func _ready():
	for key in VOLUME_KEYS:
		set_mixer_value(
			VOLUME_KEYS[key], 
			Options.get_float(VOLUME_KEYS[key], 1.0)
		)
	pass
	

func _enter_tree():
	MessageSystemExample.audio.set_mixer_value.connect(set_mixer_value)
	
func _exit_tree():
	MessageSystemExample.audio.set_mixer_value.disconnect(set_mixer_value)
	
func set_mixer_value(mixer_channel:String, value : float):
	var index = AudioServer.get_bus_index(mixer_channel)
	if index != -1:
		var value_in_db = linear_to_db(value)
		AudioServer.set_bus_volume_db(index, value_in_db)
	pass
	
