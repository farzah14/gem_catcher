extends Node2D
var gems: Array[Node2D]

@onready var gem: Area2D = $gem
@onready var gem_2: Area2D = $gem2
@onready var gem_3: Area2D = $gem3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gems = [gem, gem_2, gem_3]

#Function for gem touches to paddle area, will score Increase by 1
#func _on_paddle_area_entered(area: Area2D) -> void:
	#if area == gem or area == gem_2 or area == gem_3:
		#score+=1
		#area.position.y = 0
		#print(score)
