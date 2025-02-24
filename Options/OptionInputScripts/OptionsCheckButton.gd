extends CheckButton
class_name OptionsCheckButton
@export var options_key : String
@export var default_true : bool

func _ready():
	self.toggled.connect(on_toggle)
	self.set_pressed_no_signal(Options.get_bool(options_key, default_true))
	
func on_toggle(toggle_state:bool):
	print("Toggled On: ", toggle_state)
	Options.set_bool(options_key, toggle_state)
