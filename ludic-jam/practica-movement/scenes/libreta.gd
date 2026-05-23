extends Node2D

@onready var dibujo_llave = $Fondo/DibujoLlave

func _process(_delta):
	# Ahora la libreta se encarga de escucharse a sí misma
	if Input.is_action_just_pressed("abrir_libreta"):
		visible = !visible
		get_tree().paused = visible
		
		if visible:
			actualizar_libreta()

func actualizar_libreta():
	if Progreso.tiene_llave_oxidada == true:
		dibujo_llave.visible = true
	else:
		dibujo_llave.visible = false
