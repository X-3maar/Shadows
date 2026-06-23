extends Node2D
const obstacle = preload("res://Scenes/obstacle.tscn")
var timer = 0
var max = 0.6
var now = 1.5
@onready var label_2: Label = $"../CanvasLayer/Label2"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_2.text = str(Global.score)
	var random = randf_range(50,-50)
	timer += delta

	var obstacles = obstacle.instantiate()
	obstacles.global_position = global_position + Vector2(0,random)
	if now > max:
		if timer > now:
			now -= 0.005
	if timer > now:
		add_child(obstacles)
		timer = 0
