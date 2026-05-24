extends Area2D

var ruta_siguiente_nivel = "res://scenes/scene2/scene2.tscn"
const BALLOON = preload("res://menu/scenes/dialoguesScenes/balloon.tscn")
const DIALOGO_NO_IGLESIA = preload("res://dialogues/no_Iglesia.dialogue")
const DIALOGO_SI_IGLESIA = preload("res://dialogues/si_Iglesia.dialogue")

var dialogo_activo: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("action") and not dialogo_activo:
		var cuerpos_tocando = get_overlapping_bodies()
		for cuerpo in cuerpos_tocando:
			if cuerpo.name == "CharacterBody2D":
				_evaluar_salida()

func _evaluar_salida() -> void:
	if not Progreso.entro_a_iglesia:
		await _mostrar_dialogo(DIALOGO_NO_IGLESIA, "no_iglesia")
	else:
		await _mostrar_dialogo(DIALOGO_SI_IGLESIA, "si_iglesia")
		get_tree().change_scene_to_file(ruta_siguiente_nivel)

func _mostrar_dialogo(dialogo, titulo: String) -> void:
	dialogo_activo = true
	var dm = get_node("/root/DialogueManager")
	dm.show_dialogue_balloon_scene(BALLOON, dialogo, titulo)
	await dm.dialogue_ended
	dialogo_activo = false
