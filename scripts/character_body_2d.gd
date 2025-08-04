extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -1500.0

var start_position = Vector2(200, 250)
var jumps_done = 0
const MAX_JUMPS = 2

func die():
	position = start_position
	jumps_done = 0
	get_parent().reset_timer()

func _ready():
	position = start_position

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		if Input.is_action_pressed("down"):
			velocity.y += get_gravity().y * delta * 50
		else:
			velocity.y += get_gravity().y * delta * 5  
	else:
		jumps_done = 0  

	if Input.is_action_just_pressed("jump") and jumps_done < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jumps_done += 1
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("jump") # Always play jump animation on every jump

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
		jumps_done = 0
		get_parent().reset_timer()
		
		
	move_and_slide()
