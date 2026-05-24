extends Area2D

var ruta_siguiente_nivel = "res://scenes/scene2/scene2.tscn"

func _process(delta):
	# Revisamos si se está presionando la tecla N
	if Input.is_action_just_pressed("action"):
		
		# Obtenemos una lista de todo lo que está tocando el área
		var cuerpos_tocando = get_overlapping_bodies()
		
		# Revisamos si el Nopal Man está dentro de esa lista
		for cuerpo in cuerpos_tocando:
			if cuerpo.name == "CharacterBody2D":
				get_tree().change_scene_to_file(ruta_siguiente_nivel)
