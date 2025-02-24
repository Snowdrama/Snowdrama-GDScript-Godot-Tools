class_name AudioMessages
signal request_song(song_name:String)
signal request_override_song(song_name:String)
signal clear_override_song

signal play_sound_2D(sound_stream:AudioStream, position:Vector2)
signal play_sound_3D(sound_stream:AudioStream, position:Vector3)

signal set_mixer_value(mixer_channel:String, value:float)
