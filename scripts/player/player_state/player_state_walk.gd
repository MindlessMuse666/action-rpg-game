""" State's child-class which manages the player's walk state. """
""" Дочерний класс State, который управляет состоянием движения игрока. """
class_name PlayerStateWalk extends PlayerState



@export var movement_speed: float = 100.0

@onready var idle: PlayerState = $"../idle"



func state_process(_delta: float) -> PlayerState:
	if player.direction == Vector2.ZERO:
		return idle

	player.velocity = player.direction * movement_speed

	if player.set_direction():
		player.update_animation(GlobalConstants.walk)

	return null


func state_physics_process(_delta: float) -> PlayerState:
	return null


""" Procedure which is called when entering an walk state. """
""" Процедура, которая выполняется при входе в состояние джижения. """
func enter() -> void:
	player.update_animation("walk")


""" Procedure that is called when the walk state is exited. """
""" Процедура, которая выполняется при выходе из состояния джижения. """
func exit() -> void:
	pass


func handle_input(_event: InputEvent) -> PlayerState:
	return null
