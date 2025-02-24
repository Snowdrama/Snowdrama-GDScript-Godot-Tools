extends Node
class_name TransitionManager

signal scene_hidden_signal

@export var scene_manager : SceneManager
@export var transition_list : Array[Transition]
var current_transition : Transition
enum TransitionState { NONE, HIDING_SCREEN, WAITING, SHOWING_SCREEN }
var state : TransitionState = TransitionState.NONE

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	
func _process(delta):
	match state:
		TransitionState.NONE: 
			pass
		TransitionState.HIDING_SCREEN: 
			if current_transition.hide_scene(delta):
				state = TransitionState.WAITING
				scene_hidden_signal.emit()
			pass
		TransitionState.WAITING: 
			# We're waiting on the scene manager to tell us we can show
			pass
		TransitionState.SHOWING_SCREEN: 
			if current_transition.show_scene(delta):
				MessageSystemExample.scene_management.scene_transition_complete.emit()
				state = TransitionState.NONE
			pass
	pass
	
#start hiding the screen
func start_hiding_screen():
	current_transition = transition_list.pick_random()
	state = TransitionState.HIDING_SCREEN

#start showing the screen
func start_showing_screen():
	state = TransitionState.SHOWING_SCREEN
	pass
