extends Control

onready var scene_tree: = get_tree()
#specifying variable type allows for more specific autocompletion when calling methods on it
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_PlayerData_player_died")
	update_interface()
	

func _unhandled_input(event: InputEvent) -> void:
	if (event .is_action_pressed("Pause")):
		#self ensures that variable goes thru the setter function
		self.paused = not paused #!paused would also work
		scene_tree.set_input_as_handled()
		

func update_interface() -> void:
	

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
