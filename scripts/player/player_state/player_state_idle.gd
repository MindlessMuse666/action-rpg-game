""" PlayerState's child-class which manages the player's idle state. """
""" Дочерний класс PlayerState, который управляет состоянием бездействия игрока. """
class_name PlayerStateIdle extends PlayerState



@onready var walk: PlayerState = $"../walk"



func state_process(_delta: float) -> PlayerState:
	if player.direction != Vector2.ZERO:
		return walk

	player.velocity = Vector2.ZERO
	return null


func state_physics_process(_delta: float) -> PlayerState:
	return null


""" Procedure which is called when entering an idle state. """
""" Процедура, которая выполняется при входе в состояние бездействия. """
func enter() -> void:
	player.update_animation(GlobalConstants.idle)


""" Procedure that is called when the idle state is exited. """
""" Процедура, которая выполняется при выходе из состояния бездействия. """
func exit() -> void:
	pass


func handle_input(_event: InputEvent) -> PlayerState:
	return null
