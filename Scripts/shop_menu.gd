extends Control



func _on_bow_pressed():
	State.firstWeapon = "Bow"


func _on_baguette_pressed():
	State.firstWeapon = "Baguette"


func _on_shield_pressed():
	State.secondWeapon = "Shield"


func _on_phi_pressed():
	State.secondWeapon = "Phi"


func _on_lapin_pressed():
	State.secondWeapon = "Lapin"
