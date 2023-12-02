extends Node2D

var damage = 10
var is_attacking = false
var attack_duration = 0.05
var time_till_end_attack = 0

var player = get_parent()

var type_ = "baguette"

func _process(delta):
	if is_attacking:
		if time_till_end_attack <= 0:
			is_attacking = false
			$Area2DLeft/CollisionShape2D.disabled = true
			$Area2DRight/CollisionShape2D.disabled = true
			$Area2DUp/CollisionShape2D.disabled = true
			$Area2DDown/CollisionShape2D.disabled = true
		else:
			time_till_end_attack -= delta
	
	if Input.is_action_pressed("ui_attack"):
		attack()
	
func attack():	
	is_attacking = true
	time_till_end_attack = attack_duration
	$Area2DLeft/CollisionShape2D.disabled = false
	$Area2DRight/CollisionShape2D.disabled = false
	$Area2DUp/CollisionShape2D.disabled = false
	$Area2DDown/CollisionShape2D.disabled = false

func _collision(body):
	if is_attacking:
		if 'type_' in body:
			var type_element = body.type_
			if type_element == 'enemy':
				body.attack(damage)
	else:
		pass
