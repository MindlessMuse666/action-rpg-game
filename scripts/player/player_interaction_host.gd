class_name PlayerInteractionHost extends Node2D



@onready var player: Player = $".."



func _ready() -> void:
	player.direction_changed.connect(update_direction)



func update_direction(new_direction: Vector2) -> void:
	match new_direction:
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = -90
		Vector2.UP:
			rotation_degrees = 180
		_:
			rotation_degrees = 0