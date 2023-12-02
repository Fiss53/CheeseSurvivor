extends CharacterBody2D

@export var SPEED = 2
@export var health_points = 100

signal dies

func _ready():
	pass

func _process(delta):
	var player_vars = get_node("/root/Player")
	
	velocity.x = player_vars.position.x - position.x
	velocity.y = player_vars.position.y - position.y
	velocity = velocity.normalized() * SPEED / delta
	
	look_at(player_vars.position)
	
	move_and_slide()
