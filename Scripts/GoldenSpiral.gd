extends Node2D

var is_attacking = false
var start_pos
var current_angle
var current_speed = 10
var rotate_speed = 5
var damage = 50
var max_angle = 19.5

func compute_speed(delta):
	current_speed -= delta * 1.5

func _process(delta):
	if is_attacking:
		compute_speed(delta)
		current_angle += current_speed * delta
		rotate(delta * rotate_speed)
		position = start_pos + exp(0.306 * current_angle) * Vector2(cos(current_angle), sin(current_angle))
	
		if current_angle >= max_angle:
			is_attacking = false
			queue_free()

func attack():
	is_attacking = true
	start_pos = position
	current_angle = 0


func _on_area_2d_body_entered(body):
	if is_attacking:
		if "type_" in body:
			if body.type_ == "enemy":
				body.attack(damage)
