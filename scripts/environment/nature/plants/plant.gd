class_name Plant extends Node2D



func _ready() -> void:
	$hit_box.damaged.connect(take_damage)


func take_damage(_damage: int) -> void:
	queue_free()