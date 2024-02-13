extends Node2D

signal rabbit_pet_generated

func _process(delta):
	if Input.is_action_just_pressed("ui_attack2"):
		rabbit_pet_generated.emit()
		
