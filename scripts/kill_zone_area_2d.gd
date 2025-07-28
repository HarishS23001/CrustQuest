extends Area2D

func _on_body_entered(body):
	if body.name == "Crust Carl":
		body.position = body.start_position
