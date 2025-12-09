extends Area2D

#First speed used by gem
@export var BASE_SPEED: float = 200.0

#Speed will increase with certain conditions
@export var speed:float = 0.0

signal finish_game

#First position y of Gem
var first_position: float = 26.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var paddle:= $"../Paddle"
	#connected between sender(paddle) and function receiver(gem)
	paddle.scored.connect(_on_paddle) 
	
	#Settings speed to first speed when first time playing
	speed = BASE_SPEED
	add_to_group("gems")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Movement gem y(top to bottom) axis
	position.y += speed * delta
	
#	#Condition if gem touches the bottom of the 2d canvas
	if position.y > get_viewport_rect().end.y:
		position.y = first_position
		ScoreManagers.increase_point(-1)
	
	#Do finish game will score equal 10
	if ScoreManagers.score == 10:
		finish_game.emit()
		set_process(false)
		
#Function for back to first position y	 when gem hit paddle.
func _on_paddle(gem_hit:Area2D) -> void:
	if gem_hit == self:
		position.y = first_position
		ScoreManagers.increase_point(1)
	
		
