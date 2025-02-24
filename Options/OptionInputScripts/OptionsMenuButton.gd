extends MenuButton
class_name OptionsMenuButton

@export var option_name: String
var option_name_index : String = option_name + "_index"
var option_name_id : String = option_name + "_id"
var option_name_text : String = option_name + "_text"

var menu_data : Dictionary

func _ready():
	self.about_to_popup.connect(_on_about_to_popup)
	self.get_popup().index_pressed.connect(_on_index_pressed)
	menu_data = {
		option_name_index : 0,
		option_name_id : self.get_popup().get_item_id(0),
		option_name_text : self.get_popup().get_item_text(0),
	}
	
	if Options.has_dict(option_name):
		menu_data = Options.get_dict(option_name, menu_data)
	
	self.set_block_signals(true)
	self.get_popup().set_focused_item(0)
	self.set_block_signals(false)
	update_label(menu_data)

func _on_about_to_popup():
	pass

func _on_index_pressed(index : int):
	var item_text = self.get_popup().get_item_text(index)
	var item_id = self.get_popup().get_item_id(index)
	
	menu_data = {
		option_name_index : index,
		option_name_id : item_id,
		option_name_text : item_text,
	}
	
	Options.set_dict(option_name, menu_data)
	update_label(menu_data)
	pass


func update_label(menu_data:Dictionary):
	self.text = menu_data[option_name_text]
	
