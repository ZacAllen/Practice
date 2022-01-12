extends KinematicBody2D
class_name Actor

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0

var _velocity: = Vector2.ZERO

const FLOOR_NORMAL: = Vector2.UP


	#_velocity.y = max(_velocity.y, speed.y)
#	_velocity = move_and_slide(_velocity)	
