extends Node2D

@export var move_distance := Vector2(200, 0)
@export var move_speed := 100.0

var start_position: Vector2
var direction := 1

func _ready():
	start_position = position

func _process(delta):
	position += Vector2(move_speed * delta * direction, 0) if move_distance.y == 0 else Vector2(0, move_speed * delta * direction)
	
	if (position - start_position).length() >= move_distance.length():
		direction *= -1
