extends Area2D
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $"../AudioStreamPlayer2D2"
@onready var checkpoint_2: Area2D = $"../../checkpoint2"
@onready var collider_2: CollisionShape2D = $"../../SpikeKillZone/Collider2"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation: AnimationPlayer = $"../../animation"
@onready var shadow: CharacterBody2D = $"../Shadow"
func _on_body_entered(body: Node2D) -> void:
	Global.count += 1	
	if Global.count == 3:
		checkpoint_2.queue_free()
		collider_2.queue_free()
		Global.dash = true
		audio_stream_player_2d_2.play()
		collision_shape_2d.queue_free()
		animation.play("fade")
		Global.cnswitch = true
		shadow.queue_free()
