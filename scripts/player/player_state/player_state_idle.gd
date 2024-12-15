""" PlayerState's child-class which manages the player's idle state. """
""" Дочерний класс PlayerState, который управляет состоянием бездействия игрока. """
class_name PlayerStateIdle extends PlayerState



@onready var walk: PlayerState = $"../walk"
@onready var attack: PlayerState = $"../attack"



func state_process(_delta: float) -> PlayerState:
	if player.direction != Vector2.ZERO:
		return walk

	player.velocity = Vector2.ZERO
	return null


func state_physics_process(_delta: float) -> PlayerState:
	return null


func enter() -> void:
	""" Procedure which is called when entering an idle state. """
	""" Процедура, которая выполняется при входе в состояние бездействия. """
	player.update_animation(GlobalConstants.idle)


func exit() -> void:
	""" Procedure that is called when the idle state is exited. """
	""" Процедура, которая выполняется при выходе из состояния бездействия. """
	pass



func handle_input(_event: InputEvent) -> PlayerState:
	""" Function which responds to Input System events, affecting the current state. """
	""" Функция, которая реагирует на события Input System, влияя на текущее состояние. """
	if _event.is_action_pressed("attack"):
		return attack

	return null
