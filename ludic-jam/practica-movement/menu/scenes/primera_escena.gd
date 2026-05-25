extends Node2D

@export var menu_libreta: Node2D

func _ready() -> void:
	$Fade_transition/AnimationPlayer.play("fade_out")
	
	if Progreso.spawn_desde_iglesia:
		$Character/CharacterBody2D.global_position = Vector2(2700, 482)
		Progreso.spawn_desde_iglesia = false
