extends Node2D

var type_ = "shield"
var health_points = 100
var time_till_active = 30
var activation_duration = 30


func _process(delta):
	if health_points <= 0:
		visible = false
		time_till_active -= delta
		if time_till_active <= 0:
			health_points = 100
			time_till_active = activation_duration
			visible = true
			$".."._update_hp_label()

func attack(damage):
	health_points -= damage
	if health_points <= 0:
		health_points = 0
