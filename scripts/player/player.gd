""" Class which is responsible for the player's behaviour and reaction to triggers """
""" Класс, который отвечает за поведение игрока и его реакцию на триггеры """
class_name Player extends CharacterBody2D



@onready var animation: AnimationPlayer = $animation
@onready var sprite: Sprite2D = $sprite
@onready var state_machine: PlayerStateMachine = $state_machine

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO



func _ready() -> void:
	state_machine.initialize(self)


func _process(_delta: float) -> void:
	_move()


func _physics_process(_delta: float) -> void:
	move_and_slide()



func update_animation(state: String) -> void:
	""" Animation update. """
	""" Обновление анимации. """
	animation.play(state + "_" + get_animation_direction())


func set_direction() -> bool:
	""" Function which returns `true` and updates the player's direction if it has changed. """
	""" Функция, которая возвращает true и обновляет направление игрока, если оно изменилось. """
	var new_direction: Vector2 = cardinal_direction

	if direction == Vector2.ZERO:
		return false

	if direction.y == 0:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN

	if new_direction == cardinal_direction:
		return false

	cardinal_direction = new_direction
	_flip_sprite()

	return true


func get_animation_direction() -> String:
	""" Function which returns a string defining the direction for the animation. """
	""" Функция, возвращающая строку, определяющую направление для анимации. """
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"


func _move() -> void:
	""" Player movement which is based on an Input System. """
	""" Передвижение игрока, основанное на Input System. """
	direction = Vector2 (
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()


func _flip_sprite() -> void:
	""" Sprite flip when the player turns. """
	""" Поворот спрайта на 180° при повороте игрока. """
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
