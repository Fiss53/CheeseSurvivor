extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var totalsecs = Time.get_ticks_msec() / 1000
	
	var mins = totalsecs / 60
	var secs = totalsecs % 60
	
	if (mins < 10):
		text = "0" + str(mins)
	else:
		text = str(mins)
	
	text += ":"
	
	if (secs < 10):
		text += "0" + str(secs)
	else:
		text += str(secs)
