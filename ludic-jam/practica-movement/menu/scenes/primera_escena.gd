extends Node2D
func _ready() -> void:
	$Fade_transition/AnimationPlayer.play("fade_out")
# Creamos el espacio vacío para conectar la libreta de forma segura
@export var menu_libreta: Node2D
