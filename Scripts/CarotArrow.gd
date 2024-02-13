extends Node2D

var nb_pixels_bow = 16.0
var nb_frames = 16.0
var nb_fps = 210.0
var speed
var is_attacking = false
var damage = 100

var last_player_direction

static var pos_left = Vector2(-18, 0)
static var pos_right = Vector2(18, 0)
static var pos_up = Vector2(0, -18)
static var pos_down = Vector2(0, 18)

static var rot_up = -PI/2
static var rot_down = PI/2
static var rot_left = PI
static var rot_right = 0

func _ready():
	speed = (nb_pixels_bow * $Sprite2D.scale.x) / (nb_frames / nb_fps)


func initialize(last_player_direction, bow_position):
	self.last_player_direction = last_player_direction
	match(last_player_direction):
		Vector2.UP:
			position = bow_position + pos_up
			rotation = rot_up
		Vector2.DOWN:
			position = bow_position + pos_down
			rotation = rot_down
		Vector2.LEFT:
			position = bow_position + pos_left
			rotation = rot_left
		Vector2.RIGHT:
			position = bow_position + pos_right
			rotation = rot_right

	attack()


func _process(delta):
	match(last_player_direction):
		Vector2.UP:
			position.y -= speed * delta
		Vector2.DOWN:
			position.y += speed * delta
		Vector2.LEFT:
			position.x -= speed * delta
		Vector2.RIGHT:
			position.x += speed * delta
		

func attack():
	is_attacking = true

func _collision(body):
	if is_attacking:
		if "type_" in body:
			if body.type_ == "enemy":
				body.attack(damage)
				queue_free()

func _on_area_2d_area_entered(area):
	if "type_" in area:
		if area.type_ == "bounds":
			queue_free()


func _on_timer_timeout():
	queue_free()
