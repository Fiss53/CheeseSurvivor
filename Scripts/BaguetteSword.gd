extends Node2D

var damage = 50
var is_attacking = false
var attack_duration = 0.05
var time_till_end_attack = 0

static var pos_left = Vector2(-38, 0)
static var pos_right = Vector2(38, 0)
static var pos_up = Vector2(0, -38)
static var pos_down = Vector2(0, 38)

static var rot_left = -90
static var rot_right = 0
static var rot_up = -70
static var rot_down = 110

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
	
	var player = get_parent()
	match(player.last_direction):
		Vector2.LEFT: $Area2DLeft/CollisionShape2D.disabled = false
		Vector2.RIGHT: $Area2DRight/CollisionShape2D.disabled = false
		Vector2.UP: $Area2DUp/CollisionShape2D.disabled = false
		Vector2.DOWN: $Area2DDown/CollisionShape2D.disabled = false

func orientate():
	var player = get_parent()
	match(player.last_direction):
		Vector2.LEFT:
			position = pos_left
			rotation = rot_left
		Vector2.RIGHT:
			position = pos_right
			rotation = rot_right
		Vector2.UP:
			position = pos_up
			rotation = rot_up
		Vector2.DOWN:
			position = pos_down
			rotation = rot_down

func _collision(body):
	if is_attacking:
		if 'type_' in body:
			var type_element = body.type_
			if type_element == 'enemy':
				body.attack(damage)
	else:
		pass
