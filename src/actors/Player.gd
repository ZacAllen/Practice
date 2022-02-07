extends Actor

var direction: = Vector2.ZERO

export var stomp_impulse: = 1000.0

func _on_EnemyDetector_area_entered(area):
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body):
	die()
	


#is not overwritten, runs both processes from parent and child class
func _physics_process(delta: float) -> void:
	#adds momentum to jump, i.e. holding key jumps higher
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	#we moved this from actor so it is not constantly overwritten there, which would slow down the player object
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)	 


func get_direction() -> Vector2:
	#here we're calculating the player X movement by determining the direction, positive = right, negative = left
	#Y movement is represented by second parameter, if player jumping etc 	
	return  Vector2 (
		#getactionstrength returns 0 to 1
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)

func calculate_move_velocity(
	linear_velocity: Vector2, 
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2: 
	
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time() #delta represents time elapsed since previous frame
	if direction.y == -1.0:
		out.y = speed.y * direction.y 
	if is_jump_interrupted:
		out.y = 0.0
	return out

func calculate_stomp_velocity(
	linear_velocity: Vector2,
	stomp_impulse: float
) -> Vector2:
	
	var out: = linear_velocity
	out.y = -stomp_impulse
	return out

func die() -> void:
	PlayerData.deaths += 1;
	queue_free()
