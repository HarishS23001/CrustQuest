extends CharacterBody2D

const SPEED = 200.0
const GRAVITY = 2000.0
const CHASE_DISTANCE = 700.0 
var start_position = Vector2(1348, 543)

@onready var player = get_parent().get_node("Crust Carl")

func _ready():
	start_position = position
	$Area2D.body_entered.connect(_on_body_entered)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta  # Apply gravity

	var distance_to_player = player.global_position.distance_to(global_position)

	if player and distance_to_player < CHASE_DISTANCE:
		var direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * SPEED  # Only chase horizontally

		# Jump if hitting a wall
		if is_on_wall() and is_on_floor():
			velocity.y = -800  # Adjust jump strength as needed

		# Animation logic
		if abs(velocity.x) > 10:
			if $AnimatedSprite2D.animation != "run":
				$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = velocity.x < 0
		else:
			if $AnimatedSprite2D.animation != "idle":
				$AnimatedSprite2D.play("idle")
	else:
		velocity.x = 0
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")

	move_and_slide()

func _on_body_entered(body):
	if body.name == "Crust Carl":
		body.position = body.start_position
		position = start_position
