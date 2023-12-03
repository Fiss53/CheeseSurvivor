extends CharacterBody2D

@onready var animated_sprite = get_node("AnimatedSpritePlayer")
@export var SPEED = 2
@export var health_points = 100
var direction
var last_direction = Vector2.RIGHT

var type_ = "player"

func _ready():
	_update_hp_label()
	

func _process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	direction = Vector2(direction_x,direction_y)
	match(direction):
		Vector2.ZERO:
			animated_sprite.stop()
			animated_sprite.set_frame(0)
		Vector2.RIGHT: animated_sprite.play("right")
		Vector2.LEFT: animated_sprite.play("left")
		Vector2.UP: animated_sprite.play("upLeft")
		Vector2.DOWN: animated_sprite.play("left")
		Vector2(1,-1): animated_sprite.play("upRight")
		Vector2(-1,-1): animated_sprite.play("upLeft")
	if direction != Vector2.ZERO:
		last_direction = direction
	$Weapon.orientate()
	
	velocity = Vector2(direction_x, direction_y).normalized() * SPEED / delta
	
	move_and_slide()

func _update_hp_label():
	$HPLabel.text = "HP : %d/100" % health_points

func attack(damage):
	health_points -= damage
	if health_points < 0:
		health_points = 0
	_update_hp_label()
