extends Area2D

var ruta_pueblo = "res://menu/scenes/primera_escena.tscn"

func _process(_delta):
	if Input.is_action_just_pressed("action"):
		var cuerpos_tocando = get_overlapping_bodies()
		for cuerpo in cuerpos_tocando:
			if cuerpo.name == "CharacterBody2D":
				get_tree().change_scene_to_file(ruta_pueblo)
