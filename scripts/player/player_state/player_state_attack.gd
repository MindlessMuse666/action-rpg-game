""" PlayerState's child-class which manages the player's attack state. """
""" Дочерний класс PlayerState, который управляет состоянием атаки игрока. """
class_name PlayerStateAttack extends PlayerState


@export var attack_audio: AudioStream = preload("res://assets/audio/sfx/attack_sfx/sword_attack.wav")
@export_range(.5, 20, .5) var decelerate_speed: float = 5.75

@onready var idle: PlayerState = $"../idle"
@onready var walk: PlayerState = $"../walk"
@onready var animation: AnimationPlayer = $"../../animation"
@onready var attack_animation: AnimationPlayer = $"../../sprite/attack_sprite/attack_animation"
@onready var audio: AudioStreamPlayer2D = $"../../audio/audio"

var is_attack: bool = false



func state_process(_delta: float) -> PlayerState:
	player.velocity -= player.velocity * decelerate_speed * _delta

	if !is_attack:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk

	return null


func state_physics_process(_delta: float) -> PlayerState:
	return null


func handle_input(_event: InputEvent) -> PlayerState:
	return null



func enter() -> void:
	""" Procedure which is called when entering an attack state. """
	""" Процедура, которая выполняется при входе в состояние атаки. """

	# Анимация / Animation
	is_attack = true
	animation.animation_finished.connect(_end_attack)
	player.update_animation(GlobalConstants.attack)
	attack_animation.play(GlobalConstants.attack + "_" + player.get_animation_direction())

	# Аудио / Audio
	audio.stream = attack_audio
	audio.pitch_scale = randf_range(.9, 1.1)
	audio.play()


func exit() -> void:
	""" Procedure that is called when the attack state is exited. """
	""" Процедура, которая выполняется при выходе из состояния атаки. """
	is_attack = false
	animation.animation_finished.disconnect(_end_attack)


func _end_attack(_new_animation_name: String) -> void:
	""" Procedure for exiting the attack state. """
	""" Процедура выхода из состояния атаки. """
	is_attack = false
