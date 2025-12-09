extends Node

var score:int = 0
var status_finish:bool = false

func increase_point(point:int)->void:
	score+=point
	if score < 0:
		score = 0
	print(score)
