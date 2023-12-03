extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for node in get_children():
		if (node.position.distance_to(get_node("../Player").position) >= 900):
			node.queue_free()
