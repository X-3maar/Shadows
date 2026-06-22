extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	animation_player.play("trick")
	global_position = Vector2(-10000,10000)
