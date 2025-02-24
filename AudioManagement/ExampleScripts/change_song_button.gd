extends Button

@export var song_name : String

func _enter_tree():
	self.pressed.connect(request_song)

func _exit_tree():
	self.pressed.disconnect(request_song)	
	
func request_song():
	MessageSystemExample.audio.request_song.emit(song_name)
