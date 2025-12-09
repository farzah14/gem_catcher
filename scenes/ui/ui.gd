extends Node2D

var gem_scene = preload("res://scenes/gem/gem.tscn")
var game_is_paused:bool = false

@onready var paddle: Area2D = $"./Paddle"
@onready var timer: Timer = $Timer

#function for spawn gem
func spawn_gem():
	var new_gem = gem_scene.instantiate()
	new_gem.position.x = randi() % 1000 + 50
	add_child(new_gem)
	
	if new_gem.has_signal("finish_game"):
		new_gem.finish_game.connect(_on_finish_game)
			
func _process(delta: float) -> void:
	for gem in get_tree().get_nodes_in_group("gems"):
		if ScoreManagers.score >= 5:
			gem.speed = 300.0
			paddle.SPEED = 400.0
		else:
			gem.speed = gem.BASE_SPEED

#Duration of gem appearance and spawn
func _on_timer_timeout() -> void:
	spawn_gem()

#Finish Game
func _on_finish_game() -> void:
	print("Game Finished")
	game_is_paused = true 
	
	#Stop the timer to spawn
	timer.stop() 

	#All gems will stop if the status is finished.
	for gem in get_tree().get_nodes_in_group("gems"):
		gem.set_process(false) 
	
