extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Speed for movement Gem
@export var SPEED: float = 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#First position of Gem
	var first_position: float = 26.0
	
	#Movement paddle y(top to bottom) axis
	position.y += 200.0 * delta
	
#	#Condition if gem touches the bottom of the 2d canvas
	if position.y > get_viewport_rect().end.y:
		set_process(false)
		queue_free()
