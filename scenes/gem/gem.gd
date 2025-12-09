extends Area2D
@onready var paddle: Area2D = $"../Paddle"

#First speed used by gem
var BASE_SPEED: float = 200.0

#Speed will increase with certain conditions
var speed:float = 0.0

#First position of Gem
var first_position: float = 26.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connected between sender(paddle) and function receiver(gem)
	paddle.scored.connect(_on_paddle) 
	speed = BASE_SPEED
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Movement paddle y(top to bottom) axis
	position.y += speed * delta
	
#	#Condition if gem touches the bottom of the 2d canvas
	if position.y > get_viewport_rect().end.y:
		position.y = first_position
		ScoreManagers.total_point(-1)

#Function for back to first position when gem hit paddle.
func _on_paddle(gem_hit:Area2D) -> void:
	if gem_hit == self:
		position.y = first_position
