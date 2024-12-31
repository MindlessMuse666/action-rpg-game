""" Class that handles collision handling (SEARCHING for a collision)  """
""" Класс, который отвечает обработку столкновений (ИЩЕТ столкновение) """
class_name HurtBox extends Area2D



@export var damage: int = 1



func _ready() -> void:
	area_entered.connect(_on_area_entered)



func _on_area_entered(a: Area2D) -> void:
	if a is HitBox:
		a.take_damage(damage)
