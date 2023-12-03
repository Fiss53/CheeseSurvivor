extends Node2D

static var attack_elapsed_time = 0
static var is_attacking = false
static var nb_fps = 210.0 
static var nb_frames = 16.0
static var anim_duration

static var pos_left = Vector2(-38, 0)
static var pos_right = Vector2(38, 0)
static var pos_up = Vector2(0, -38)
static var pos_down = Vector2(0, 38)

static var rot_up = -PI/2
static var rot_down = PI/2
static var rot_left = PI
static var rot_right = 0

func _ready():
	# TODO: vérifier pour il faut diviser par scale
	anim_duration = nb_frames / (nb_fps * $AnimatedSprite2D.scale.x)

func _process(delta):
	if is_attacking:
		attack_elapsed_time += delta
		if attack_elapsed_time >= anim_duration:
			attack_elapsed_time = 0
			$AnimatedSprite2D.play("idle")
			
			var prefab_carrot_arrow = preload("res://Prefabs/Weapons/CarotArrow.tscn")
			var carrot_arrow = prefab_carrot_arrow.instantiate()
			get_node("/root/MainScene").add_child(carrot_arrow)
			carrot_arrow.initialize($"..".last_direction, global_position)
			is_attacking = false
	
	if Input.is_action_pressed("ui_attack"):
		attack()

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

func attack():
	is_attacking = true
	attack_elapsed_time = 0
	$AnimatedSprite2D.play("attack")
