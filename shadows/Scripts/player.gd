extends CharacterBody2D

@onready var back: Button = $"../CanvasLayer/Back"
@onready var pause: ColorRect = $"../CanvasLayer/pause"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation: AnimationPlayer = $"../animation"

var delay_timer = 0.0
var SPEED = 150.0
var JUMP_VELOCITY = -290.0
var direction = 0
var dash_timer = 0.0
var dashed = false

func _physics_process(delta: float) -> void:
	
	if dash_timer > 0:
		dash_timer -= delta
	
	if delay_timer > 0:
		delay_timer -= delta
	
	if not is_on_floor() and is_on_wall() and Global.wall:
		velocity += get_gravity() * delta 
		if is_on_wall() and velocity.y > 0:
			velocity.y = min(velocity.y,85)
		if Input.is_action_pressed("move_right"):
			animated_sprite_2d.play("slide")
			animated_sprite_2d.flip_h = false
			if Input.is_action_just_pressed("jump"):
				velocity.x = JUMP_VELOCITY - 200
				velocity.y = JUMP_VELOCITY
		elif Input.is_action_pressed("move_left"):
			animated_sprite_2d.play("slide")
			animated_sprite_2d.flip_h = true
			if Input.is_action_just_pressed("jump"):
				velocity.x = -JUMP_VELOCITY + 200
				velocity.y = JUMP_VELOCITY
	elif not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Global.dash and delay_timer <= 0:
		if Input.is_action_just_pressed("dash"):
			dash_timer = 0.2
			delay_timer = 1.0
			var dash_dir = -1 if animated_sprite_2d.flip_h else 1
			velocity.x = dash_dir * 400
			animated_sprite_2d.play("dash")
			audio_stream_player_2d.play()
			set_collision_layer_value(1, false)
			set_collision_layer_value(2, true)
			set_collision_mask_value(1, false)
			set_collision_mask_value(2, true)
			dashed = true

	if dash_timer <= 0:
		set_collision_layer_value(1, true)
		set_collision_layer_value(2, false)
		set_collision_mask_value(1, true)
		set_collision_mask_value(2, false)
		direction = Input.get_axis("move_left", "move_right")
		
		if (modulate == Color(1.0, -91, 0.059, 0.757)):
			animated_sprite_2d.play("die")
		else:
			if !is_on_floor() and not is_on_wall():
				animated_sprite_2d.play("jump")
				if direction < 0: animated_sprite_2d.flip_h = true
				elif direction > 0: animated_sprite_2d.flip_h = false
			
			if direction:
				velocity.x = move_toward(velocity.x,direction * SPEED, 40)
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				
			if is_on_floor():
				if direction < 0:
					animated_sprite_2d.flip_h = true
					animated_sprite_2d.play("run")
				elif direction > 0:
					animated_sprite_2d.flip_h = false
					animated_sprite_2d.play("run")
				elif direction == 0:
					animated_sprite_2d.play("idle")

	if Input.is_action_just_pressed("escape"):
		pause.show()
		Engine.time_scale = 0.0
		back.hide()
	if Input.is_action_just_pressed("continue"):
		pause.hide()
		Engine.time_scale = 1.0
		back.show()
	if Input.is_action_just_pressed("ui_text_backspace"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		Bgm.stop()
		Engine.time_scale = 1.0
	if Input.is_action_just_pressed("Map") and !Global.map and ! animation.is_playing():
		animation.play("mapin")
		Global.map = true
		SPEED = 0
		JUMP_VELOCITY = 0
		await animation.animation_finished
		Engine.time_scale = 0.0
	elif Input.is_action_just_pressed("Map") and Global.map and !animation.is_playing():
		animation.play("mapout")
		Global.map = false
		SPEED = 150
		JUMP_VELOCITY = -290
		Engine.time_scale = 1.0
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


func _on_checkpoint_body_entered(body: Node2D) -> void:
	Global.dash = true
