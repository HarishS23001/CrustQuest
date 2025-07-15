extends CharacterBody2D

const SPEED = 200.0
const GRAVITY = 2000.0

@onready var player = get_parent().get_node("Crust Carl")

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta  # Apply gravity

	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * SPEED  # Only chase horizontally

	move_and_slide()

func _on_body_entered(body):
	if body.name == "Crust Carl":
		body.position = body.start_position
