extends Area2D

var ruta_siguiente_nivel = "res://scenes/sceneIglesia/iglesiadentro.tscn"

const BALLOON = preload("res://menu/scenes/dialoguesScenes/balloon.tscn")
const DIALOGO_SIN_LLAVE = preload("res://dialogues/sin_llave.dialogue")

var dialogo_activo: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("action") and not dialogo_activo:
		var cuerpos_tocando = get_overlapping_bodies()
		for cuerpo in cuerpos_tocando:
			if cuerpo.name == "CharacterBody2D":
				if Progreso.tiene_llave_oxidada:
					get_tree().change_scene_to_file(ruta_siguiente_nivel)
				else:
					_mostrar_mensaje_sin_llave()

func _mostrar_mensaje_sin_llave() -> void:
	dialogo_activo = true
	var dm = get_node("/root/DialogueManager")
	dm.show_dialogue_balloon_scene(BALLOON, DIALOGO_SIN_LLAVE, "sin_llave")
	await dm.dialogue_ended
	dialogo_activo = false
