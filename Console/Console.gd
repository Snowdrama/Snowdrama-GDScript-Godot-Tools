extends Node
class_name Console

signal callbackSignal

static var instance : Console

var canvas_layer : CanvasLayer
var control : Panel
var console_text : RichTextLabel
var console_input : LineEdit

var named_callbacks : Dictionary[String, Command]

func _ready():
	if instance == null:
		instance = self
	else:
		self.queue_free()
		return
	console_input.text_submitted.connect(_on_text_submitted)
	
func _on_text_submitted(text : String):
	console_text.add_text("%s" % text)

static func log(text : String):
	instance.console_text.add_text("%s" % text)
	

static func registerCommand(command : String, callback : Callable):
	instance.named_callbacks["Thing"]
	if !instance.named_callbacks.has(command):
		instance.named_callbacks.set(command, Command.new(
			command,
			
		))
	
	instance.callbackSignal.connect(callback)
	
	
class Command:
	var command : String
	var arguments : PackedStringArray
	var description : String
	var callbacks : Dictionary[String, Callable]
	func _init(command: String):
		self.command = command
	
	func run():
		for callback in callbacks:
			print(callback)

func _enter_tree():
	canvas_layer = CanvasLayer.new()
	control = Panel.new()
	control.anchor_top = 0.0
	control.anchor_bottom = 0.5
	control.anchor_left = 0.0
	control.anchor_right = 1.0
	
	console_text = RichTextLabel.new()
	console_text.anchor_top = 0.0
	console_text.anchor_bottom = 0.9
	console_text.anchor_left = 0.0
	console_text.anchor_right = 1.0
	
	console_input = LineEdit.new()
	console_input.anchor_top = 0.9
	console_input.anchor_bottom = 1.0
	console_input.anchor_left = 0.0
	console_input.anchor_right = 1.0
	
	control.add_child(console_text)
	control.add_child(console_input)
	canvas_layer.add_child(control)
	add_child(canvas_layer)
