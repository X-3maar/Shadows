extends Area2D
@onready var player: CharacterBody2D = $"../Player"
@onready var area_2d: Area2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_body_entered(body: Node2D) -> void:

	get_tree().call_deferred("change_scene_to_file","res://Scenes/level_1.tscn")
