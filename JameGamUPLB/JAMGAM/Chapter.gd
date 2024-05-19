extends Control


func _on_chapter_pressed():
	get_tree().change_scene_to_file("res://Scenes/chapter_1.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/menu.tscn")
