extends Node2D

@export var MAX_ENNEMIES = 10

func _process(_delta):
	var ennemies_count = get_child_count()
	if (ennemies_count < MAX_ENNEMIES):
		var r_min = 900
		var r_max = 1900
		
		var angle = randf_range(0, 2 * PI)
		var r = randf_range(r_min, r_max)
		
		var ennemy_x = int(cos(angle) * r)
		var ennemy_y = int(sin(angle) * r)
		
		var ennemy = load("res://Scenes/Ennemy.tscn").instantiate()
		ennemy.position.x = $"../Player".position.x + ennemy_x
		ennemy.position.y = $"../Player".position.y + ennemy_y
		
		add_child(ennemy)
