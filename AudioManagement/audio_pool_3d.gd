extends Node
class_name AudioPool3D

static var instance : AudioPool3D

@export var initial_source_count: int = 16
@export var sound_list : Array[AudioStream]

var sounds : Dictionary[String, AudioStream]

var audio_sources : Array[AudioStreamPlayer3D]
var used_audio_sources : Array[AudioStreamPlayer3D]

func _ready():
	if instance != null:
		#we free if there's already a pool
		self.queue_free()
		return
	for i in range(0, initial_source_count):
		var new_source = AudioStreamPlayer3D.new();
		audio_sources.append(new_source)
	for sound in sound_list:
		sounds.set(sound.resource_name, sound)

func _enter_tree():
	MessageSystemExample.audio.play_sound_3D.connect(play_sound_3D)
	pass

func _exit_tree():
	MessageSystemExample.audio.play_sound_3D.disconnect(play_sound_3D)
	pass

func play_sound_3D(sound_stream:AudioStream, sound_position:Vector3):
	var source = audio_sources.pop_back()
	used_audio_sources.append(source)
	
	source.stream = sound_stream
	source.global_position = sound_position
	source.play()
	pass
