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
	
	var player_vars = get_node("/root/MainScene/Player")
	
	var dead_mouse_texture = ImageTexture.create_from_image(
		Image.load_from_file("res://Assets/DeadMouse.png"))
	
	var dead_mouse_sprite = Sprite2D.new()
	
	dead_mouse_sprite.set_texture(dead_mouse_texture)
	dead_mouse_sprite.set_scale(Vector2(3, 3))
	dead_mouse_sprite.position = position
	dead_mouse_sprite.look_at(player_vars.position)
	dead_mouse_sprite.rotate(-PI / 2)
	
	get_node("/root/MainScene/DeadEnnemies").add_child(dead_mouse_sprite)
