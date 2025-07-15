extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -900.0

var start_position = Vector2(200, 250)

func _ready():
	# Optional: Reset position at start
	position = start_position

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		if Input.is_action_pressed("down"):
			velocity.y += get_gravity().y * delta * 20  # Fast drop
		else:
			velocity.y += get_gravity().y * delta * 3   # Normal gravity

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")

	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

	if not is_on_floor():
		if $AnimatedSprite2D.animation != "jump":
			$AnimatedSprite2D.play("jump")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	if position.y > 1500:
		position = start_position

	move_and_slide()
