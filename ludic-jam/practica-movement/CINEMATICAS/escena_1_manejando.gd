extends Node2D

const BALLOON = preload("res://menu/scenes/dialoguesScenes/balloon.tscn")

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("escena_1_manejando")
	await get_tree().create_timer(0.5).timeout
	
	animation_player.speed_scale = 0.0
	var dialogo = load("res://dialogues/Escena1.dialogue")
	var dm = get_node("/root/DialogueManager")
	dm.show_dialogue_balloon_scene(BALLOON, dialogo, "intro")
	await dm.dialogue_ended
	
	animation_player.speed_scale = 1.0
	await get_tree().create_timer(2.0).timeout
	ir_al_nivel_jugable()

func ir_al_nivel_jugable() -> void:
	get_tree().change_scene_to_file("res://menu/scenes/primera_escena.tscn")
