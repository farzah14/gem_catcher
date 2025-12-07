extends Node2D
var node:Array[Node2D]

@onready var icon: Sprite2D = $Icon
@onready var icon2: Sprite2D = $Icon2
@onready var icon3: Sprite2D = $Icon3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	node = [icon, icon2]
	
var SPEED: int = 400
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in node: 
		i.position.y += SPEED * delta
		if i.position.y > 600.0:
			i.position.y = 88.0
			i.position.x = randi() % 1000 + 80
	
	icon3.scale += Vector2(2,2) * delta
	var max_scale: float = 1.500 
	if icon3.scale.x > max_scale and icon3.scale.y > max_scale:
		icon3.scale = Vector2(1,1) * delta
		
	
		
	
