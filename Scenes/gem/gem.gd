extends Area2D

#Speed for movement Gem
@export var SPEED: float = 200.0
@onready var paddle: Area2D = $"../Paddle"

#First position of Gem
var first_position: float = 26.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connected between sender(paddle) and function receiver(gem)
	paddle.scored.connect(_on_paddle) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Movement paddle y(top to bottom) axis
	position.y += 200.0 * delta
	
#	#Condition if gem touches the bottom of the 2d canvas
	if position.y > get_viewport_rect().end.y:
		position.y = first_position

#Function for back to first position when gem hit paddle.
func _on_paddle(gem_hit:Area2D) -> void:
	if gem_hit == self:
		position.y = first_position
