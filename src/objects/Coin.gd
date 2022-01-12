extends Area2D

#onready runs code before ready function
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")



func _on_body_entered(body):
	anim_player.play("fade_out") #play fadeout anim when colliding with player
