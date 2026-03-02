extends Control
@onready var play: Button = $CanvasLayer/Play
@onready var exit: Button = $CanvasLayer/Exit
@onready var settings: Button = $CanvasLayer/Settings
@onready var color_rect: ColorRect = $CanvasLayer/SettingsGroup/ColorRect
@onready var back: Button = $CanvasLayer/SettingsGroup/Back
@onready var options: HSlider = $CanvasLayer/SettingsGroup/options

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Bgm.play()
	

func _on_exit_pressed() -> void:
	pass # Replace with function body.
	get_tree().quit()
	

func _on_settings_pressed() -> void:
	color_rect.show()
	back.show()
	options.show()
	play.hide()
	exit.hide()
	settings.hide()
	options.show()

func _on_back_pressed() -> void:
	color_rect.hide()
	back.hide()
	options.hide()
	play.show()
	exit.show()
	settings.show()
	


func _on_options_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_h_slider_2_value_changed(value: float) -> void:
	pass # Replace with function body.
	AudioServer.set_bus_volume_db(1,value)


func _on_h_slider_3_value_changed(value: float) -> void:
	pass # Replace with function body.
	AudioServer.set_bus_volume_db(2,value)
