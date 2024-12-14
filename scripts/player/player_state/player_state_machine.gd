""" Сlass of interaction of player states with each other, based on the ‘State Machine’ pattern. """
""" Класс взаимодействия состояний игрока друг с другом, основанный на паттерне ’State Machine’. """
class_name PlayerStateMachine extends Node



var states: Array[PlayerState]
var previous_state: PlayerState
var current_state: PlayerState



func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED


func _process(_delta: float) -> void:
	_change_state(current_state.state_process(_delta))


func _physics_process(_delta: float) -> void:
	_change_state(current_state.state_physics_process(_delta))


func _unhandled_input(event: InputEvent) -> void:
	_change_state(current_state.handle_input(event))



func initialize(_player: Player) -> void:
	""" Player's state-machine initialisation procedure. """
	""" Процедура инициализвации машины состояний игрока. """
	states = []

	for clild in get_children():
		if clild is PlayerState:
			states.append(clild)

	if states.size() > 0:
		states[0].player = _player
		_change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT


func _change_state(new_state: PlayerState) -> void:
	""" Procedure for valid player state change. """
	""" Процедура валидной смены состояния игрока. """
	if new_state == null or new_state == current_state:
		return

	if current_state:
		current_state.exit()

	previous_state = current_state
	current_state = new_state
	current_state.enter()
