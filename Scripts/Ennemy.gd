extends CharacterBody2D

@export var SPEED = 2
@export var health_points = 100
@onready var animation = get_node("AnimatedSprite2D")

var type_ = "enemy"

signal dies

func _ready():
	animation.stop()
	animation.set_frame_progress(0.0)

func _process(delta):
	var player_vars = get_node("/root/MainScene/Player")
	
	velocity.x = player_vars.position.x - position.x
	velocity.y = player_vars.position.y - position.y
	velocity = velocity.normalized() * SPEED / delta
	
	if (health_points == 0):
		animation.play()
		get_node("CollisionPolygon2D").disabled = true
	else:
		look_at(player_vars.position)
		move_and_slide()

func attack(damage):
	health_points -= damage
	
	if health_points < 0:
		health_points = 0
	
	#if health_points == 0:
	#	queue_free()
	#	get_node("/root/MainScene/EnnemyPool").max_ennemies += 1
	#print('hp: ' + str(health_points))


func _on_animated_sprite_2d_animation_finished():
	queue_free()
	get_node("/root/MainScene/EnnemyPool").max_ennemies += 1
