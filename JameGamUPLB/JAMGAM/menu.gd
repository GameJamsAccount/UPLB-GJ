extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	MainMenu.play_music_level()
	$CenterContainer/VBoxContainer/Start.grab_focus()
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/Chapter.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/options.tscn")


func _on_quit_pressed():
	get_tree().quit()

