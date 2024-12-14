""" Parent-class which controls the player's states. """
""" Класс-родитель, который управляет состояниями игрока. """
class_name PlayerState extends Node



static var player: Player



func state_process(_delta: float) -> PlayerState:
	return null


func state_physics_process(_delta: float) -> PlayerState:
	return null


""" Procedure which is called when entering an idle state. """
""" Процедура, которая выполняется при входе в состояние бездействия. """
func enter() -> void:
	pass


""" Procedure that is called when the idle state is exited. """
""" Процедура, которая выполняется при выходе из состояния бездействия. """
func exit() -> void:
	pass


func handle_input(_event: InputEvent) -> PlayerState:
	return null
