extends AudioStreamPlayer
class_name MusicManager

var audio_stream : AudioStreamInteractive

var current_song : String
var override_song : String

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	if self.stream is AudioStreamInteractive:
		audio_stream = self.stream	
		current_song = audio_stream.get("clip_{0}/name".format([audio_stream.initial_clip])) as String
	else:
		printerr("Music Manager requires using an interactive stream")

func _enter_tree():
	MessageSystemExample.audio.request_song.connect(request_song)
	MessageSystemExample.audio.request_override_song.connect(request_override_song)
	MessageSystemExample.audio.clear_override_song.connect(clear_override_song)
	
func _exit_tree():
	MessageSystemExample.audio.request_song.disconnect(request_song)
	MessageSystemExample.audio.request_override_song.disconnect(request_override_song)
	MessageSystemExample.audio.clear_override_song.disconnect(clear_override_song)
	
func request_song(song_name:String):
	print("Requesting Song Name: ", song_name)
	current_song = song_name
	self.set("parameters/switch_to_clip", song_name)
	pass	
func request_override_song(override_song_name:String):
	print("Requesting override Song Name: ", override_song_name)
	override_song = override_song_name;
	self.set("parameters/switch_to_clip", override_song)
	pass
	
func clear_override_song():
	print("Clearing Override Song Name: ", override_song)
	print("Returning to Song Name: ", current_song)
	self.set("parameters/switch_to_clip", current_song)
	pass
