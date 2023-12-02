extends CharacterBody2D
@onready var animated_sprite = get_node("AnimatedSpritePlayer")
@export var SPEED = 2
var direction
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
	
	velocity = Vector2(direction_x, direction_y).normalized() * SPEED / delta
	
	move_and_slide()
