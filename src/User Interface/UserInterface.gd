extends Control

onready var scene_tree: = get_tree()
#specifying variable type allows for more specific autocompletion when calling methods on it
onready var resume_button: Button = get_node("PauseOverlay/PauseMenu/ResumeButton")
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Label")
onready var pause_title: Label = get_node("PauseOverlay/Title")

var paused: = false setget set_paused

const DIED_MESSAGE = "You died!"

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()
	

func _on_PlayerData_player_died() -> void:
	self.paused = true
	resume_button.visible = false
	pause_title.text = DIED_MESSAGE

func _unhandled_input(event: InputEvent) -> void:
	if (event .is_action_pressed("Pause")) and pause_title.text != DIED_MESSAGE:
		#self ensures that variable goes thru the setter function
		self.paused = not paused #!paused would also work
		scene_tree.set_input_as_handled()
		

func update_interface() -> void:
	score.text = "Score: %s" %PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
