tool #enables warning to show in editor
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer #$ is shorthand for get_node

export var next_scene: PackedScene #is assigned in Script Variables

func _on_body_entered(body):
	teleport()


func _get_configuration_warning() -> String:
	#throw error if next scene is undefined
	return "The next scene property can't be empty!" if not next_scene else ""


func teleport() -> void: 
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


