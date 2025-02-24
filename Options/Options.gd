extends Node
class_name Options

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	
func _enter_tree():
	Load()

func _exit_tree():
	Save()

static var game_data : Dictionary = {
	"float_vars":{},
	"int_vars":{},
	"string_vars":{},
	"bool_vars":{},
	"color_vars":{},
	"dict_vars":{},
}

# ██ ███    ██ ████████     ██    ██  █████  ██████  ███████ 
# ██ ████   ██    ██        ██    ██ ██   ██ ██   ██ ██      
# ██ ██ ██  ██    ██        ██    ██ ███████ ██████  ███████ 
# ██ ██  ██ ██    ██         ██  ██  ██   ██ ██   ██      ██ 
# ██ ██   ████    ██          ████   ██   ██ ██   ██ ███████ 
														   
static func set_int(key:String, value:int):
	game_data["int_vars"].set(key, value)
	Save()
	
static func get_int(key:String, default:int = 0) -> int:
	Load()
	if !has_int(key):
		game_data["int_vars"].set(key, default)
	return game_data["int_vars"].get(key) 
	
static func has_int(key:String) -> bool:
	if game_data["int_vars"].has(key):
		return true
	return false
	
# ██████   ██████   ██████  ██          ██    ██  █████  ██████  ███████ 
# ██   ██ ██    ██ ██    ██ ██          ██    ██ ██   ██ ██   ██ ██      
# ██████  ██    ██ ██    ██ ██          ██    ██ ███████ ██████  ███████ 
# ██   ██ ██    ██ ██    ██ ██           ██  ██  ██   ██ ██   ██      ██ 
# ██████   ██████   ██████  ███████       ████   ██   ██ ██   ██ ███████ 

static func set_bool(key:String, value:bool):
	game_data["bool_vars"].set(key, value)
	Save()
	
static func get_bool(key:String, default:bool = false) -> bool:
	Load()
	if !has_bool(key):
		game_data["bool_vars"].set(key, default)
	return game_data["bool_vars"].get(key)
		 
	
static func has_bool(key:String) -> bool:
	if game_data["bool_vars"].has(key):
		return true
	return false

# ███████ ████████ ██████  ██ ███    ██  ██████      ██    ██  █████  ██████  ███████ 
# ██         ██    ██   ██ ██ ████   ██ ██           ██    ██ ██   ██ ██   ██ ██      
# ███████    ██    ██████  ██ ██ ██  ██ ██   ███     ██    ██ ███████ ██████  ███████ 
#      ██    ██    ██   ██ ██ ██  ██ ██ ██    ██      ██  ██  ██   ██ ██   ██      ██ 
# ███████    ██    ██   ██ ██ ██   ████  ██████        ████   ██   ██ ██   ██ ███████ 
	
static func set_string(key:String, value:String):
	game_data["string_vars"].set(key, value)
	Save()
	
static func get_string(key:String, default:String = "") -> String:
	Load()
	if !has_string(key):
		game_data["string_vars"].set(key, default)
	return game_data["string_vars"].get(key) 
	
static func has_string(key:String) -> bool:
	if game_data["string_vars"].has(key):
		return true
	return false

# ███████ ██       ██████   █████  ████████     ██    ██  █████  ██████  ███████ 
# ██      ██      ██    ██ ██   ██    ██        ██    ██ ██   ██ ██   ██ ██      
# █████   ██      ██    ██ ███████    ██        ██    ██ ███████ ██████  ███████ 
# ██      ██      ██    ██ ██   ██    ██         ██  ██  ██   ██ ██   ██      ██ 
# ██      ███████  ██████  ██   ██    ██          ████   ██   ██ ██   ██ ███████ 
																			   
	
static func set_float(key:String, value:float):
	game_data["float_vars"].set(key, value)
	Save()
	
static func get_float(key:String, default:float = 0.0) -> float:
	Load()
	if !has_float(key):
		game_data["float_vars"].set(key, default)
	return game_data["float_vars"].get(key) 
	
static func has_float(key:String) -> bool:
	if game_data["float_vars"].has(key):
		return true
	return false

#  ██████  ██████  ██       ██████  ██████      ██    ██  █████  ██████  ███████ 
# ██      ██    ██ ██      ██    ██ ██   ██     ██    ██ ██   ██ ██   ██ ██      
# ██      ██    ██ ██      ██    ██ ██████      ██    ██ ███████ ██████  ███████ 
# ██      ██    ██ ██      ██    ██ ██   ██      ██  ██  ██   ██ ██   ██      ██ 
#  ██████  ██████  ███████  ██████  ██   ██       ████   ██   ██ ██   ██ ███████ 
	
static func set_color(key:String, value:Color):
	game_data["color_vars"].set(key, value)
	Save()
	
static func get_color(key:String, default:Color = Color.WHITE) -> Color:
	
	Load()
	if !has_color(key):
		game_data["color_vars"].set(key, default)
	return game_data["color_vars"].get(key) 

static func has_color(key:String) -> bool:
	if game_data["color_vars"].has(key):
		return true
	return false
	
	
	
	
	
	
	
	
static func set_dict(key:String, value:Dictionary):
	game_data["dict_vars"].set(key, value)
	Save()
	
static func get_dict(key:String, default:Dictionary = {}) -> Dictionary:
	Load()
	if !has_dict(key):
		game_data["dict_vars"].set(key, default)
	return game_data["dict_vars"].get(key) 

static func has_dict(key:String) -> bool:
	if game_data["dict_vars"].has(key):
		return true
	return false
	
# ███████  █████  ██    ██ ███████ 
# ██      ██   ██ ██    ██ ██      
# ███████ ███████ ██    ██ █████   
#      ██ ██   ██  ██  ██  ██      
# ███████ ██   ██   ████   ███████ 
	
static func Save():
	Load() # load first to be sure we have all the data
	validate_data()
	var json_string = JSON.stringify(game_data)
	var file = FileAccess.open("user://options.json", FileAccess.WRITE)
	file.store_string(json_string)
	file.close()
	
# ██       ██████   █████  ██████  
# ██      ██    ██ ██   ██ ██   ██ 
# ██      ██    ██ ███████ ██   ██ 
# ██      ██    ██ ██   ██ ██   ██ 
# ███████  ██████  ██   ██ ██████  

static var has_been_loaded : bool
static func Load():
	# once loaded, don't load again until game restarts!
	if !has_been_loaded:
		var file = FileAccess.open("user://options.json", FileAccess.READ)
		var json_string : String = ""
		if file != null && file.get_error() == OK:
			json_string = file.get_as_text()
		else:
			file = FileAccess.open("user://options.json", FileAccess.WRITE_READ)
			
		file.close()
		has_been_loaded = true
		var json = JSON.new()
		var error = json.parse(json_string)
		if error == OK:
			game_data = {}
			game_data = json.data
		else:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			print("Creating New Options Data")
			game_data = {}
			Save()
		validate_data()

static func validate_data():
	if game_data == null:
		game_data = {
			"float_vars":{},
			"int_vars":{},
			"string_vars":{},
			"bool_vars":{},
			"color_vars":{},
			"dict_vars":{},
		}
	if !game_data.has("float_vars"):
		game_data.set("float_vars", {})
	if !game_data.has("int_vars"):
		game_data.set("int_vars", {})
	if !game_data.has("string_vars"):
		game_data.set("string_vars", {})
	if !game_data.has("bool_vars"):
		game_data.set("bool_vars", {})
	if !game_data.has("color_vars"):
		game_data.set("color_vars", {})
	if !game_data.has("dict_vars"):
		game_data.set("dict_vars", {})
		
