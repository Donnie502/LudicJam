extends Area2D

@onready var exclamation_mark = $exclamacion
# ── NUEVO ──────────────────────────────
@onready var player = get_parent().get_node("Character/CharacterBody2D")
# ───────────────────────────────────────

const UNTITLED = preload("uid://dcwlhipyrs2q4")

var is_player_close = false
var is_dialogue_active = false

func _ready() -> void:
	if exclamation_mark:
		exclamation_mark.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	# ── NUEVO ──────────────────────────────
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	# ───────────────────────────────────────

func _process(_delta):
	if is_player_close and Input.is_action_just_pressed("action") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(UNTITLED)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		is_player_close = true
		if exclamation_mark and not is_dialogue_active:
			exclamation_mark.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		is_player_close = false
		if exclamation_mark:
			exclamation_mark.visible = false

# ── NUEVO ──────────────────────────────
func _on_dialogue_started(_resource) -> void:
	is_dialogue_active = true
	if exclamation_mark:
		exclamation_mark.visible = false
	player.block()

func _on_dialogue_ended(_resource) -> void:
	is_dialogue_active = false
	if is_player_close and exclamation_mark:
		exclamation_mark.visible = true
	player.unblock()
# ───────────────────────────────────────
