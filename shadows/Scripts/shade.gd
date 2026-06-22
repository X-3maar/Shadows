extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var back: Button = $"../CanvasLayer/Back"
@onready var pause: ColorRect = $"../CanvasLayer/pause"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation: AnimationPlayer = $"../animation"
@onready var player: CharacterBody2D = $"../Player"
@onready var camera_2d: Camera2D = $Camera2D

var delay_timer = 0.0
var SPEED = 150.0
var direction = 0
var direction1 = 0
var dash_timer = 0.0
var dashed = false

func _physics_process(delta: float) -> void:

	camera_2d.make_current()
	if Global.temp == true:
		animation_player.play("sw1")
		Global.temp = false
		audio_stream_player_2d.play()
	if process_mode == PROCESS_MODE_DISABLED:
		return
	if Global.cnswitch and Global.switch and Input.is_action_just_pressed("Switch"):
		
		player.global_position = global_position
		animation_player.play("sw2")
		await animation_player.animation_finished
		player.set_deferred("process_mode", PROCESS_MODE_INHERIT)
		player.show()
		hide()
		set_deferred("process_mode", PROCESS_MODE_DISABLED)
		return
		
	
	if dash_timer > 0:
		dash_timer -= delta
	
	if delay_timer > 0:
		delay_timer -= delta
		
	
	if Global.dash and delay_timer <= 0:
		if Input.is_action_just_pressed("dash"):
			dash_timer = 0.2
			delay_timer = 1.0
			var dash_dir = -1 if animated_sprite_2d.flip_h else 1
			velocity.x = dash_dir * 400
			animated_sprite_2d.play("dash")
			audio_stream_player_2d.play()
			dashed = true

	if dash_timer <= 0:
		direction = Input.get_axis("move_left", "move_right")
		direction1 = Input.get_axis("move_up", "move_down")
		if direction < 0: animated_sprite_2d.flip_h = true
		elif direction > 0: animated_sprite_2d.flip_h = false
		if direction:
			velocity.x = move_toward(velocity.x,direction * SPEED, 40)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if direction1:
			velocity.y = move_toward(velocity.y, direction1 * SPEED, 40)
		else:
			velocity.y = move_toward(velocity.y,0,SPEED)
	if Input.is_action_just_pressed("escape"):
		pause.show()
		Engine.time_scale = 0.0
		back.hide()
	
	if Input.is_action_just_pressed("continue"):
		pause.hide()
		Engine.time_scale = 1.0
		back.show()
	if process_mode == PROCESS_MODE_INHERIT:
		move_and_slide()
	
func _on_back_pressed() -> void:
	Engine.time_scale = 0.0
	pause.show()
	back.hide()
		
	
func _on_back_3_pressed() -> void:
	
	Engine.time_scale = 1.0
	pause.hide()
	back.show()



func _on_back_2_pressed() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	Bgm.stop()
