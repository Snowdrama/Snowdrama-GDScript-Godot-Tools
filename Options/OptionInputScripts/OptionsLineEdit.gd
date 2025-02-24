extends LineEdit

enum SaveOnType {
	SaveOnSubmitted,
	SaveOnChanged,
}
@export var save_on : SaveOnType = SaveOnType.SaveOnSubmitted
@export var option_name : String

func _ready():
	self.text_changed.connect(_on_line_changed)
	self.text_submitted.connect(_on_line_submitted)
	if Options.has_string(option_name):
		self.set_block_signals(true)
		self.text = Options.get_string(option_name)
		self.set_block_signals(false)
	
func _on_line_changed(new_text:String):
	if save_on == SaveOnType.SaveOnChanged:
		Options.set_string(option_name, new_text)
	pass
	
func _on_line_submitted(new_text:String):
	if save_on == SaveOnType.SaveOnSubmitted:
		Options.set_string(option_name, new_text)
	pass
	
