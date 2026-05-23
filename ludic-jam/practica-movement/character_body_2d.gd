extends CharacterBody2D

@export var speed = 150

func _physics_process(_delta):
	get_input()
	move_and_slide()
	player_animation()

# MOVIMIENTO
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

# ANIMACIÓN
func player_animation():
	# Si la velocidad es 0 (no se está moviendo en ninguna dirección)
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
		
	# Si hay velocidad (se está moviendo)
	else:
		$AnimatedSprite2D.play("walk")
		
		# Revisamos si se mueve en el eje X (izquierda/derecha) para voltear el sprite
		if velocity.x > 0: # Va a la derecha
			$AnimatedSprite2D.flip_h = false
		elif velocity.x < 0: # Va a la izquierda
			$AnimatedSprite2D.flip_h = true
