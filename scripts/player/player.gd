class_name Player extends CharacterBody2D



@export var move_speed: float = 100.0


@onready var animation: AnimationPlayer = $animation
@onready var sprite: Sprite2D = $sprite


var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var current_state: String = "idle"



func _process(_delta: float) -> void:
	_move()
	_update_animation()



func _physics_process(_delta: float) -> void:
	move_and_slide()



func _move() -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	velocity = direction * move_speed



func _update_animation() -> void:
	if _set_state() || _set_direction():
		animation.play(current_state + "_" + _get_animation_direction())



func _set_state() -> bool:
	var new_state: String = "idle" if direction == Vector2.ZERO else "walk"

	if new_state == current_state:
		return false

	current_state = new_state

	return true



func _set_direction() -> bool:
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



func _get_animation_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"



"""Flip sprite if cardinal_direction has been changed."""
func _flip_sprite() -> void:
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
