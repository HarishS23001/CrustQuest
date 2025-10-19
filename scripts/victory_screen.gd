extends Control

func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	
func _unhandled_input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		var current_mode = DisplayServer.window_get_mode()
		var new_mode = DisplayServer.WINDOW_MODE_WINDOWED if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(new_mode)

	if event.is_action_pressed("leave_game"):
		get_tree().quit()

func _ready():
	$CanvasLayer/PepperoniLabel.text = "Pepperoni: %d" % Global.pepperoni_collected
	$CanvasLayer/TimeLabel.text = "Time: %.1fs" % Global.time_elapsed
