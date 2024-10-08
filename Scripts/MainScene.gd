extends Node2D

func _ready():
	var firstWeapon: Node2D
	var secondaryWeapon: Node2D
	
	if State.firstWeapon == "baguette_sword":
		firstWeapon = preload("res://Prefabs/Weapons/BaguetteSword.tscn").instantiate()
	elif State.firstWeapon == "carot_bow":
		firstWeapon = preload("res://Prefabs/Weapons/CarotBow.tscn").instantiate()

	if State.secondWeapon == "shield":
		secondaryWeapon = preload("res://Prefabs/Weapons/Shield.tscn").instantiate()
	elif State.secondWeapon == "golden_spiral_gun":
		secondaryWeapon = preload("res://Prefabs/Weapons/GoldenSpiralGun.tscn").instantiate()
	elif State.secondWeapon == "rabbit_pet":
		secondaryWeapon = preload("res://Prefabs/Weapons/RabbitPetGenerator.tscn").instantiate()

	firstWeapon.name = "Weapon"
	secondaryWeapon.name = "SecondaryWeapon"
	
	$Player.add_child(firstWeapon)
	$Player.add_child(secondaryWeapon)
	
	if State.secondWeapon != "shield":
		$Player/ShieldHPLabel.visible = false

