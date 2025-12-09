extends Node2D

@onready var gem: Area2D = $"./gem"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if ScoreManagers.score >= 5:
		gem.speed = 400.0
	else:
		gem.speed = gem.BASE_SPEED
