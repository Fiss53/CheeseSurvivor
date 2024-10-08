extends Control

var selected_weapon = "baguette_sword"
var selected_secondary_weapon = "shield"

var weapon_buttons = {
	"BaguetteSwordWeaponButton": "baguette_sword",
	"CarotBowWeaponButton": "carot_bow"
}

var secondary_weapon_buttons = {
	"ShieldSecondaryWeaponButton": "shield",
	"GoldenSpiralGunSecondaryButton": "golden_spiral_gun",
	"RabbitPetSecondaryWeaponButton": "rabbit_pet"
}

func _ready():
	update_weapon_buttons()
	update_secondary_weapon_buttons()

func update_weapon_buttons():
	for button in weapon_buttons.keys():
		var color
		if selected_weapon == weapon_buttons[button]:
			color = Color(0,1,0)
		else:
			color = Color(1,1,1)
		get_node(button).get_node("Label").set("theme_override_colors/font_color", color)

func update_secondary_weapon_buttons():
	for button in secondary_weapon_buttons.keys():
		var color
		if selected_secondary_weapon == secondary_weapon_buttons[button]:
			color = Color(0,1,0)
		else:
			color = Color(1,1,1)
		get_node(button).get_node("Label").set("theme_override_colors/font_color", color)

func _on_carot_bow_weapon_button_pressed():
	selected_weapon = "carot_bow"
	update_weapon_buttons()

func _on_baguette_sword_weapon_button_pressed():
	selected_weapon = "baguette_sword"
	update_weapon_buttons()

func _on_shield_secondary_weapon_button_pressed():
	selected_secondary_weapon = "shield"
	update_secondary_weapon_buttons()	

func _on_golden_spiral_gun_secondary_button_pressed():
	selected_secondary_weapon = "golden_spiral_gun"
	update_secondary_weapon_buttons()

func _on_rabbit_pet_secondary_weapon_button_pressed():
	selected_secondary_weapon = "rabbit_pet"
	update_secondary_weapon_buttons()
