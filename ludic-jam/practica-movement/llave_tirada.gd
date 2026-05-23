extends Area2D

# Variable booleana local para saber si el jugador está pisando el área
var jugador_cerca: bool = false

func _ready():
	# Conectamos las señales de colisión de Godot a nuestras funciones de abajo
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	# Si el jugador está dentro del rango y presiona la M
	if jugador_cerca and Input.is_action_just_pressed("action"):
		agarrar_llave()

func _on_body_entered(body):
	# Verificamos si lo que entró al área es el personaje principal
	if body is CharacterBody2D:
		jugador_cerca = true

func _on_body_exited(body):
	# Si el personaje se aleja, ya no puede interactuar
	if body is CharacterBody2D:
		jugador_cerca = false

func agarrar_llave():
	# Modificamos el estado en tu Autoload global
	Progreso.tiene_llave_oxidada = true
	
	print("¡Llave guardada en la libreta!")
	
	# Borramos la llave del escenario físico
	queue_free()
