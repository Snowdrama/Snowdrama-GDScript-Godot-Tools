extends Node
class_name AudioPool2D

static var instance : AudioPool2D

@export var initial_source_count: int = 16
@export var sound_list : Array[AudioStream]

var sounds : Dictionary[String, AudioStream]

var audio_sources : Array[AudioStreamPlayer2D]
var used_audio_sources : Array[AudioStreamPlayer2D]

func _ready():
	if instance != null:
		#we free if there's already a pool
		self.queue_free()
		return
	for i in range(0, initial_source_count):
		var new_source = AudioStreamPlayer2D.new();
		audio_sources.append(new_source)
	for sound in sound_list:
		sounds.set(sound.resource_name, sound)

func _enter_tree():
	MessageSystemExample.audio.play_sound_2D.connect(play_sound_2D)
	pass

func _exit_tree():
	MessageSystemExample.audio.play_sound_2D.disconnect(play_sound_2D)
	pass

func play_sound_2D(sound_stream:AudioStream, sound_position:Vector2):
	var source = audio_sources.pop_back()
	used_audio_sources.append(source)
	
	source.stream = sound_stream
	source.global_position = sound_position
	source.play()
	pass
