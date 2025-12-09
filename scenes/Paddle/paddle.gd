extends Area2D

var SPEED: float = 300.0 #Speed for movement Paddle

#Signal that stores a parameter to get the gem that was hit.
signal scored(gem_hit: Area2D) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Movement_paddle using get_axis(-1, 1)
	var movement_paddle: float = Input.get_axis("move_left", "move_right")
	position.x +=  SPEED * delta * movement_paddle
	
	#Provides constraints paddle on x axis
	position.x = clamp(position.x, 
		get_viewport_rect().position.x, 
		get_viewport_rect().end.x
	)
	
#Function send signal to gem.gd
func _on_area_entered(area: Area2D) -> void:
	scored.emit(area)
	ScoreManagers.total_point(1)
