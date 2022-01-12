extends "res://src/actors/Actor.gd"

func _ready() -> void:
	#disables enemy until in view
	set_physics_process(false)
	
	_velocity.x = -speed.x

func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free() #deletes node
	
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	
	#change direction if enemy hits wall
	if is_on_wall():
		_velocity.x *= -1.0
		
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	




