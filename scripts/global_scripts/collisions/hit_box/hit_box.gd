""" Class that handles collision handling (MUST collide)  """
""" Класс, который отвечает обработку столкновений (ПОЗВОЛЯЕТ столкнуться) """
class_name HitBox extends Area2D



signal damaged(damage: int)



func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func take_damage(damage: int) -> void:
	damaged.emit(damage)
	print("Take damage: ", damage)
