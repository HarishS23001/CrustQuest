extends Node2D

var time_elapsed := 0.0
var pepperoni_count = 0

func _unhandled_input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		var current_mode = DisplayServer.window_get_mode()
		var new_mode = DisplayServer.WINDOW_MODE_WINDOWED if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(new_mode)
		
func _input(event):
	if event.is_action_pressed("leave_game"):
		get_tree().quit()

func _ready():
	update_pepperoni_label()
	$Music.play()

func update_pepperoni_label():
	$CanvasLayer/PepperoniLabel.text = "Pepperoni: %d" % pepperoni_count

func _on_pepperoni_collected():
	pepperoni_count += 1
	update_pepperoni_label()

func _process(delta):
	time_elapsed += delta
	$CanvasLayer/TimeLabel.text = "Time: %.1fs" % time_elapsed

func reset_timer():
	time_elapsed = 0.0
	$CanvasLayer/TimeLabel.text = "Time: 0.0s"
	
func reset_game():
	pepperoni_count = 0
	reset_timer()
	get_tree().reload_current_scene()

func _on_mouth_body_entered(body: Node2D) -> void:
	if body.name == "Crust Carl":
		get_tree().change_scene_to_file("res://scenes/victory_screen.tscn")
