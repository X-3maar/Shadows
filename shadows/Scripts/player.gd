extends CharacterBody2D
@onready var back: Button = $"../CanvasLayer/Back"
@onready var pause: ColorRect = $"../CanvasLayer/pause"

const SPEED = 150.0
const JUMP_VELOCITY = -290.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.

	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if (modulate == Color(1.0, 0.0-91, 0.059, 0.757)):
		animated_sprite_2d.play("die")
	else:
		if !is_on_floor() && direction<0:
			animated_sprite_2d.play("jump")
			animated_sprite_2d.flip_h = true
		if !is_on_floor() && direction>0:
			animated_sprite_2d.play("jump")
			animated_sprite_2d.flip_h = false
		if !is_on_floor() && direction==0:
			animated_sprite_2d.play("jump")
		if direction:
			velocity.x = direction * SPEED
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if direction < 0 && is_on_floor():
			animated_sprite_2d.flip_h = true
			animated_sprite_2d.play("run")
		elif direction >0 && is_on_floor():
			animated_sprite_2d.flip_h = false
			animated_sprite_2d.play("run")
		elif direction == 0 && is_on_floor():
			animated_sprite_2d.play("idle")
	if Input.is_action_just_pressed("escape"):
			pause.show()
			Engine.time_scale = 0.0
			back.hide()
	if Input.is_action_just_pressed("continue"):
			pause.hide()
			Engine.time_scale = 1.0
			back.show()
	move_and_slide()


func _on_back_pressed() -> void:
	Engine.time_scale = 0.0
	pause.show()
	back.hide()
	pass # Replace with function body.


func _on_back_3_pressed() -> void:
	Engine.time_scale = 1.0
	pause.hide()
	back.show()
	pass # Replace with function body.



func _on_back_2_pressed() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
	pass # Replace with function body.
