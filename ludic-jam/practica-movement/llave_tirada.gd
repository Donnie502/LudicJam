extends Area2D

# 1. Creamos la variable exportada para conectar el indicador visual de forma segura
@export var indicador_m: Sprite2D

var jugador_cerca: bool = false

func _ready():
	# Conectamos las señales de colisión de Godot a nuestras funciones de abajo
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Un seguro de vida: asegurarnos de que empiece oculto aunque olvidemos en el inspector
	if indicador_m:
		indicador_m.visible = false

func _process(_delta):
	# Si el jugador está dentro del rango y presiona la M (acción "interactuar")
	if jugador_cerca and Input.is_action_just_pressed("action"):
		agarrar_llave()

func _on_body_entered(body):
	# Verificamos si lo que entró al área es el personaje principal (CharacterBody2D)
	if body is CharacterBody2D:
		jugador_cerca = true
		
		# 2. Mostramos el indicador visual
		if indicador_m:
			indicador_m.visible = true

func _on_body_exited(body):
	# Si el personaje se aleja, ya no puede interactuar
	if body is CharacterBody2D:
		jugador_cerca = false
		
		# 3. Ocultamos el indicador visual
		if indicador_m:
			indicador_m.visible = false

func agarrar_llave():
	# Modificamos el estado en tu Autoload global
	Progreso.tiene_llave_oxidada = true
	
	print("¡Llave guardada en la libreta!")
	
	# Borramos la llave del escenario físico
	queue_free()
