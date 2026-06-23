extends AnimatableBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.call_deferred("queue_free")
	get_tree().reload_current_scene()
	
	Global.score = 0

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	Global.score +=1 
func _physics_process(delta: float) -> void:
	if !position.x < -1000:
		position.x -= 175 * delta
	else:
		call_deferred("queue_free")
