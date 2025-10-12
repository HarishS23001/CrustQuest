extends Area2D 

signal collected

func _on_body_entered(body: Node2D) -> void: 
	if body.name == "Crust Carl": 
		collected.emit() 
		queue_free() 
		
func _ready(): 
	$AnimatedSprite2D.scale = Vector2(2, 2)
