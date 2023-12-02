extends CharacterBody2D

@export var SPEED = 2
@export var health_points = 100

var type_ = "enemy"

signal dies

func _ready():
	pass

func _process(delta):
	var player_vars = get_node("/root/MainScene/Player")
	
	velocity.x = player_vars.position.x - position.x
	velocity.y = player_vars.position.y - position.y
	velocity = velocity.normalized() * SPEED / delta
	
	look_at(player_vars.position)
	
	move_and_slide()

func attack(damage):
	health_points -= damage
	if health_points < 0:
		health_points = 0
	if health_points == 0:
		queue_free()
		get_node("/root/MainScene/EnnemyPool").max_ennemies += 1
	#print('hp: ' + str(health_points))
