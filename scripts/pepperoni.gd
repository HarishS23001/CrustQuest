extends Area2D 

signal collected

var start_position: Vector2

func _ready(): 
	$AnimatedSprite2D.scale = Vector2(2, 2)
	start_position = position
	add_to_group("pepperoni")

func _on_body_entered(body: Node2D) -> void: 
	if body.name == "Crust Carl" and visible: 
		collected.emit() 
		hide()
		monitoring = false
		set_physics_process(false)
		set_process(false)

func respawn():
	position = start_position
	show()
	monitoring = true
	set_physics_process(true)
	set_process(true)
