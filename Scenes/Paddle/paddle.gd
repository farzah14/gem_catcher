extends Area2D

#Speed for movement Paddle
@export var SPEED: float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#position.x += SPEED * delta
	#if Input.is_action_pressed("move_left"):
		#position.x -= SPEED * delta
	
	#Movement_paddle using get_axis(-1, 1)
	var movement_paddle: float = Input.get_axis("move_left", "move_right")
	position.x +=  SPEED * delta * movement_paddle
	
	#Provides constraints paddle on x axis
	position.x = clamp(position.x, 
		get_viewport_rect().position.x, 
		get_viewport_rect().end.x
	)
