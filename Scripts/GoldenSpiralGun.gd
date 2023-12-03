extends Node2D

func _process(delta):
	if Input.is_action_just_released("ui_attack2"):
		if $Timer.is_stopped():
			$Timer.start()
		else:
			$Timer.stop()

func _on_timer_timeout():
	var golden_spiral_prefab = preload("res://Prefabs/Weapons/GoldenSpiral.tscn")
	var golden_spiral = golden_spiral_prefab.instantiate()
	add_child(golden_spiral)
	golden_spiral.attack()
