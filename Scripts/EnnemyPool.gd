extends Node2D

@export var ENNEMIES_BOUND =  30
@export var max_ennemies = 10

var swpan_duration = 3
var time_till_spawn = 0

func _process(_delta):
	if time_till_spawn <= swpan_duration:
		time_till_spawn += _delta
		return
	else:
		time_till_spawn = 0
	
	var ennemies_count = get_child_count()
	
	if (max_ennemies > ENNEMIES_BOUND):
		max_ennemies = ENNEMIES_BOUND
	
	if (ennemies_count < max_ennemies):
		var r_min = 300 # 900
		var r_max = 500 # 1900
		
		var angle = randf_range(0, 2 * PI)
		var r = randf_range(r_min, r_max)
		
		var ennemy_x = int(cos(angle) * r)
		var ennemy_y = int(sin(angle) * r)
		
		var ennemy = load("res://Scenes/Ennemy.tscn").instantiate()
		ennemy.position.x = $"../Player".position.x + ennemy_x
		ennemy.position.y = $"../Player".position.y + ennemy_y
		
		add_child(ennemy)
