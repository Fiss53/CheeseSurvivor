extends Node2D

@export var ENNEMIES_BOUND = 50
@export var max_ennemies = 10

func _process(_delta):
	var ennemies_count = get_child_count()
	
	if (max_ennemies > ENNEMIES_BOUND):
		max_ennemies = ENNEMIES_BOUND
	
	if (ennemies_count < max_ennemies):
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
