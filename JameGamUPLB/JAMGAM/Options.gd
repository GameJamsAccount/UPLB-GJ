extends Control


func _ready():
	pass
	

func _on_video_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/video.tscn")


func _on_audio_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/audio.tscn")


func _on_guide_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/guide.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://JAMGAM/menu.tscn")
