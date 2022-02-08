extends AudioStreamPlayer

var bgm_paused:= true setget set_play

func _ready() -> void:
	self.stream_paused = true

func set_play(value: bool) -> void:
	bgm_paused = value
	if (value == false):
		self.stream_paused = value
	else:
		self.stream_paused = value


#func _ready() -> void:
#	if(get_tree().current_scene.name == "MainScreen"):
		
