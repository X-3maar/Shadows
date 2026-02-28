extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	body.modulate = Color(1.0, 0.0-91, 0.059, 0.757)
	body.velocity = Vector2.ZERO
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
