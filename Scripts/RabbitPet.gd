extends CharacterBody2D

var target_index = 0
var speed = 2
var damage = 100

var attack_duration = 1
var time_till_end_attack = 0
var is_attacking = false

func _ready():
	reset_target()

func _process(delta):
	reset_target()
	
	var enemies = get_node("/root/MainScene/EnnemyPool").get_children()
	# do not move if no enemy
	if len(enemies) == 0:
		return
	
	# reset target index if target does not exist anymore
	if target_index >= len(enemies):
		reset_target()
	
	# move to target
	var target = enemies[target_index]
	# print(target.position)
	
	velocity.x = target.global_position.x - global_position.x
	velocity.y = target.global_position.y - global_position.y
	velocity = velocity.normalized() * speed / delta
	
	if is_attacking:
		# print("attack %d" % target_index)
		target.attack(damage)
	
	move_and_slide()


# go to closest enemy
func reset_target():
	var enemies = get_node("/root/MainScene/EnnemyPool").get_children()
	if len(enemies) == 0:
		return
	
	target_index = 0
	var closest_distance = global_position.distance_to(enemies[0].global_position)
	
	for index in range(len(enemies)):
		var enemy = enemies[index]
		var current_distance = global_position.distance_to(enemy.global_position)
		if current_distance < closest_distance:
			target_index = index


func _on_timer_timeout():
	queue_free()
	

func _on_attack_area_2d_body_entered(body):
	if "type_" in body:
		if body.type_ == "enemy":
			is_attacking = true


func _on_attack_area_2d_body_exited(body):
	if "type_" in body:
		if body.type_ == "enemy":
			is_attacking = false
