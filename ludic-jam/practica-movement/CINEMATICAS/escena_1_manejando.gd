extends Node2D

func ir_al_nivel_jugable():
	# IMPORTANTE: Asegúrate de que la ruta sea la de tu nivel (ej. primera_escena.tscn)
	# Si pones la de la cinemática, se va a ciclar infinitamente.
	get_tree().change_scene_to_file("res://menu/scenes/primera_escena.tscn")
