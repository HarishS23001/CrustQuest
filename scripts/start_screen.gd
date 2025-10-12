extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
	
func _unhandled_input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		var current_mode = DisplayServer.window_get_mode()
		var new_mode = DisplayServer.WINDOW_MODE_WINDOWED if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(new_mode)

	if event.is_action_pressed("leave_game"):
		get_tree().quit()
