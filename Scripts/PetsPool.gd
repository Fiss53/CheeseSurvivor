extends Node2D


func _on_secondary_weapon_rabbit_pet_generated():
	var rabbit_pet = preload("res://Prefabs/Weapons/RabbitPet.tscn").instantiate()
	rabbit_pet.position = $"../Player".position + Vector2(64,64)
	add_child(rabbit_pet)
