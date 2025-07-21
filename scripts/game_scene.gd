extends Node2D


func _unhandled_input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		var current_mode = DisplayServer.window_get_mode()
		var new_mode = DisplayServer.WINDOW_MODE_WINDOWED if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(new_mode)
		
func _input(event):
	if event.is_action_pressed("leave_game"):
		get_tree().quit()
