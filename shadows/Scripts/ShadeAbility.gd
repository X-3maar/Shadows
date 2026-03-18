extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation: AnimationPlayer = $"../animation"
@onready var shadow: CharacterBody2D = $"../Shadow"
func _on_body_entered(body: Node2D) -> void:
	audio_stream_player_2d.play()
	animation_player.play("Disapperaing")
	collision_shape_2d.queue_free()
	animation.play("fade")
	body.has_dash = true
	shadow.queue_free()
	

	pass # Replace with function body.
