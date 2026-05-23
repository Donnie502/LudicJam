extends Area2D


@onready var exclamation_mark = $exclamacion


const UNTITLED = preload("uid://dcwlhipyrs2q4")



var is_player_close = false
var is_dialogue_active = false


func _ready() -> void:
	
	if exclamation_mark:
		exclamation_mark.visible = false
	
	# Conectamos las colisiones físicas que ya vimos que sí funcionan
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	# Si estás en el rango y presionas Enter o Espacio
	if is_player_close and Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_dialogue_balloon(UNTITLED)
		# Aquí mandarán llamar al plugin global para que pinte el texto en la interfaz

# ─── LOGICA DE DETECCIÓN DE INTERACCIÓN ───

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		is_player_close = true
		if exclamation_mark:
			exclamation_mark.visible = true # ¡Aparece el signo rojo!

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		is_player_close = false
		if exclamation_mark:
			exclamation_mark.visible = false # Se desvanece al alejarte
