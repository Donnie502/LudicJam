extends Node2D

@onready var dibujo_llave = $Fondo/DibujoLlave

func _ready() -> void:
	# La música ignora la pausa del árbol
	var music = get_node("/root/MenuMusic")
	if music:
		music.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if Input.is_action_just_pressed("abrir_libreta"):
		if _is_dialogue_active():
			return
		visible = !visible
		get_tree().paused = visible
		if visible:
			actualizar_libreta()

func actualizar_libreta():
	dibujo_llave.visible = Progreso.tiene_llave_oxidada

func _is_dialogue_active() -> bool:
	for node in get_tree().get_nodes_in_group("dialogue"):
		return true
	for child in get_tree().get_root().get_children():
		for grandchild in child.get_children():
			if "balloon" in grandchild.name.to_lower():
				return true
	return false
