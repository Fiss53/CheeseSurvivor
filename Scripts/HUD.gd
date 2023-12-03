extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game
@onready var message = $Message
@onready var start_button = $StartButton
@onready var score_Label = $ScoreLabel
@onready var MessageTimer = $MessageTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta):
	pass

func show_message(text):
	message.text = text
	message.show()
	MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await MessageTimer.timeout

	message.text = "Dodge the Creeps!"
	message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	start_button.start_button()
	
func update_score(score):
	score_Label.text = str(score)

func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()

func _on_message_timer_timeout():
	message.hide()
