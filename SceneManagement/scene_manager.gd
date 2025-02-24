extends Node
class_name SceneManager

@export var automaticScenePaths : Array[String] = [
	"res://scenes"
]
@export var transition_manager : TransitionManager
var scene_list : Dictionary[String, PackedScene]
var current_scene : Node

var next_scene_target : String

func set_scene_as_current(set_current_scene : Node):
	current_scene = set_current_scene
	
func _enter_tree():
	MessageSystemExample.scene_management.go_to_scene.connect(go_to_scene)
	MessageSystemExample.scene_management.set_scene_as_current.connect(set_scene_as_current)
	transition_manager.scene_hidden_signal.connect(scene_hidden)
	pass
	
func _exit_tree():
	MessageSystemExample.scene_management.go_to_scene.disconnect(go_to_scene)
	MessageSystemExample.scene_management.set_scene_as_current.disconnect(set_scene_as_current)
	pass
	
	
func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	print_rich("[wave amp=25.0 freq=10.0][color=#0080FF]Reminder the SceneManager uses the first node's name in the file, NOT THE SCENES FILE NAME!!!![/color][/wave]");
	print_rich("[wave amp=25.0 freq=10.0][color=#00FF80]Also that if the name contains spaces it will escape them with underscores!!![/color][/wave]");
	
	for resourcePath in automaticScenePaths:
		var sceneResourcePath = DirAccess.open(resourcePath)
		if sceneResourcePath != null:
			load_scenes_from_directory(resourcePath, sceneResourcePath)
	
	pass

func load_scenes_from_directory(resource_path:String, scene_resource_path:DirAccess):
	var filePaths = scene_resource_path.get_files();
	for path in filePaths:
		var possible_path = resource_path + "/" + path
		print("loading from path: ", possible_path)
		#I forgot why this is needed but sometimes this happens
		
		if possible_path.contains(".tmp"):
			continue
			
		if possible_path.contains(".remap"):
			possible_path = possible_path.replace(".remap", "")
		
		#This tosses things it can't read
		if !ResourceLoader.exists(possible_path):
			printerr("Path ", possible_path, "doesn't contain a path the resource loader can read")
		
		var possibly_a_scene = ResourceLoader.load(possible_path) as PackedScene
		
		if possibly_a_scene == null:
			continue
		
		var name = possibly_a_scene.get_state().get_node_name(0).replace(" ", "_")
		
		if !scene_list.has(name):
			print("Adding Scene with key: ", name)
			scene_list.set(name, possibly_a_scene)
		else:
			printerr("Scene already exists in list: ", name)
	pass
	
#this is called when the transition is hidden
func scene_hidden():
	#Do we have a scene with that name?
	if scene_list.has(next_scene_target):
		# Clear the current scene and spawn a copy of the new scene
		if current_scene != null:
			current_scene.queue_free()
		var loaded_scene = scene_list[next_scene_target].instantiate()
		get_tree().root.add_child(loaded_scene)
		current_scene = loaded_scene
		transition_manager.start_showing_screen()
	else:
		#we skipped the transition let's just show again...
		printerr("scene_list does not contain: ", next_scene_target)
		transition_manager.start_showing_screen()

func go_to_scene(new_scene_name : String):
	if scene_list.has(new_scene_name):
		next_scene_target = new_scene_name
		transition_manager.start_hiding_screen()
	pass
