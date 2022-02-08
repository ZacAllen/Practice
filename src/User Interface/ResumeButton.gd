extends Button

onready var pause_overlay: ColorRect = get_node("../../../PauseOverlay")
onready var pause_title: = get_node("../../Title")

func _ready() -> void:
#	update_visible()
	self.visible = true
#
#func update_visible():
#	if(pause_title and pause_title.text == "You died!"):
#		self.visible = false	

func _on_button_up() -> void:
	#not supposed to do this since I already defined this string as a const in UI.gd, but eh
	if(pause_title.text != "You died!"):
		get_tree().paused = false
		pause_overlay.visible = false
