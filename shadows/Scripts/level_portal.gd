extends Area2D
@onready var player: CharacterBody2D = $"../Player"
@onready var area_2d: Area2D = $"."

var path
func _process(delta: float) -> void:
	path = "res://Scenes/level" + str(Global.scene) + ".tscn"

func _on_body_entered(body: Node2D) -> void:

	get_tree().call_deferred("change_scene_to_file",path)
	Global.scene += 1
