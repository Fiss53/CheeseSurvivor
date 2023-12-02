extends Node2D

@export var MAX_ENNEMIES = 5

var ennemies_count = 0

func _process(_delta):
	if (ennemies_count < MAX_ENNEMIES):
		var angle = randf_range(0, 2 * PI)
		
		var ennemy_x = int(cos(angle) * 900)
		var ennemy_y = int(sin(angle) * 900)
		
		var ennemy = load("res://Scenes/Ennemy.tscn").instantiate()
		ennemy.position.x = $"../Player".position.x + ennemy_x
		ennemy.position.y = $"../Player".position.y + ennemy_y
		
		add_child(ennemy)
		ennemies_count += 1
