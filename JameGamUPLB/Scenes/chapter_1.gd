extends Node

const SceneTwo = preload("res://Songs/boss_scene.tscn")
const TBC = preload("res://Scenes/to_be_continued.tscn")

func _ready():
	$Timer.start()
	
func _on_timer_timeout():
	$Transition.transition()
	
func _on_transition_transitioned():
	$SceneChange.get_child(0).queue_free()
	$SceneChange.add_child(SceneTwo.instantiate())
	$TBC.start()

func _on_tbc_timeout():
	$SceneChange.get_child(0).queue_free()
	$SceneChange.add_child(TBC.instantiate())
	$CloseGame.start()

func _on_close_game_timeout():
	get_tree().quit()
