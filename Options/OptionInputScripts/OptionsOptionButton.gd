extends OptionButton
class_name OptionsOptionButton

@export var option_name : String

func _ready():
	self.item_selected.connect(_on_item_selected)
	self.set_block_signals(true)
	self.select(Options.get_int(option_name))
	self.set_block_signals(false)
	
func _on_item_selected(index):
	Options.set_int(option_name, index)	
	print(index)
