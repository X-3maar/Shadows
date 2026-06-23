extends Node2D
@onready var shade: CharacterBody2D = $shade
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: CharacterBody2D = $Player
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var label: Label = $CanvasLayer/Label
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var animation_player_3: AnimationPlayer = $AnimationPlayer3
@onready var animation_player_4: AnimationPlayer = $AnimationPlayer4
@onready var play: Button = $CanvasLayer/Play
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bgm.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	await animation_player.animation_finished
	audio_stream_player_2d.play()
	await audio_stream_player_2d.finished
	player.global_position = shade.global_position
	shade.queue_free.call_deferred()
	await animation_player_2.animation_finished
	label.show()
	await animation_player_3.animation_finished
	label.hide()
	color_rect.show()
	color_rect.self_modulate.a = 100
	color_rect.modulate.a = 100
	await animation_player_4.animation_finished
	play.show()
	


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
