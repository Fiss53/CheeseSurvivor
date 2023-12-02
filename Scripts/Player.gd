extends CharacterBody2D

@export var SPEED = 2

func _process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(direction_x, direction_y).normalized() * SPEED / delta
	
	move_and_slide()
