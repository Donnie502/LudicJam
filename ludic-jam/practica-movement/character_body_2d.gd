extends CharacterBody2D

@export var walk_speed = 150
@export var run_speed = 300

# ── NUEVO ──────────────────────────────
var is_blocked: bool = false
# ───────────────────────────────────────

func _physics_process(_delta):
	get_input()
	move_and_slide()
	player_animation()

func get_input():
	# ── NUEVO ──────────────────────────────
	if is_blocked:
		velocity = Vector2.ZERO
		return
	# ───────────────────────────────────────
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("correr"):
		velocity = input_direction * run_speed
	else:
		velocity = input_direction * walk_speed

func player_animation():
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	else:
		if Input.is_action_pressed("correr"):
			$AnimatedSprite2D.play("walk")
		else:
			$AnimatedSprite2D.play("walk")
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite2D.flip_h = true

# ── NUEVO ──────────────────────────────
func block() -> void:
	is_blocked = true
	velocity = Vector2.ZERO

func unblock() -> void:
	is_blocked = false
# ───────────────────────────────────────
