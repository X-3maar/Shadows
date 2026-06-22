extends Control
@onready var play: Button = $CanvasLayer/Play
@onready var exit: Button = $CanvasLayer/Exit
@onready var settings: Button = $CanvasLayer/Settings
@onready var color_rect: ColorRect = $CanvasLayer/SettingsGroup/ColorRect
@onready var back: Button = $CanvasLayer/SettingsGroup/Back
@onready var options: HSlider = $CanvasLayer/SettingsGroup/options
@onready var documentation: Button = $CanvasLayer/Documentation
@onready var levels: Button = $CanvasLayer/Levels
@onready var levelist: ColorRect = $CanvasLayer/LevelsGroup/levelist
@onready var docs: ColorRect = $CanvasLayer/DocumGroup/docs

func _ready() -> void:
	pass # Replace with function body.


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
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
	documentation.hide()
	levels.hide()

func _on_back_pressed() -> void:
	color_rect.hide()
	back.hide()
	options.hide()
	play.show()
	exit.show()
	settings.show()
	documentation.show()
	levels.show()
	levelist.hide()	
	docs.hide()


func _on_options_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_h_slider_2_value_changed(value: float) -> void:
	pass # Replace with function body.
	AudioServer.set_bus_volume_db(1,value)


func _on_h_slider_3_value_changed(value: float) -> void:
	pass # Replace with function body.
	AudioServer.set_bus_volume_db(2,value)


func _on_documentation_pressed() -> void:
	pass
	documentation.hide()
	play.hide()
	settings.hide()
	levels.hide()
	exit.hide()
	docs.show()
	back.show()


func _on_levels_pressed() -> void:
	play.hide()
	documentation.hide()
	levels.hide()
	settings.hide()
	levels.hide()
	exit.hide()
	levelist.show()
	back.show()


func _on_readme_pressed() -> void:
	OS.shell_open("https://github.com/X-3maar/Shadows/blob/main/README.md")


func _on_walkthrough_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=Iqr3XIhSnUQ&pp=ygUYYSB2aWRlbyBzYXlzIGNvbWluZyBzb29u")


func _on_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")


func _on_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level2.tscn")


func _on_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level3.tscn")

func _on_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level4.tscn")


func _on_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level5.tscn")

func _on_6_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level6.tscn")

func _on_7_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level7.tscn")

func _on_8_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level8.tscn")

func _on_9_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level9.tscn")


func _on_10_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level10.tscn")


func _on_sp_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/specialevel.tscn")
