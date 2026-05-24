extends Node2D

@onready var dibujo_llave = $Fondo/DibujoLlave

func _process(_delta):
	if Input.is_action_just_pressed("abrir_libreta"):
		# No abrir si hay diálogo activo
		if _is_dialogue_active():
			return
		
		visible = !visible
		get_tree().paused = visible
		if visible:
			actualizar_libreta()

func actualizar_libreta():
	if Progreso.tiene_llave_oxidada == true:
		dibujo_llave.visible = true
	else:
		dibujo_llave.visible = false

# ── Busca el balloon en toda la escena ──
func _is_dialogue_active() -> bool:
	# Busca recursivamente en todo el árbol
	for node in get_tree().get_nodes_in_group("dialogue"):
		return true
	# Busca por nombre en Primera_escena
	for child in get_tree().get_root().get_children():
		for grandchild in child.get_children():
			if "balloon" in grandchild.name.to_lower():
				return true
	return false
