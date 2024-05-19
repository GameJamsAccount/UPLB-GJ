extends CanvasLayer

signal transitioned

func transition():
	$AnimationPlayer.play("Fade_to_black")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Fade_to_black":
		emit_signal("transitioned")
		$AnimationPlayer.play("Fade_To_normal")
	if anim_name == "Fade_to_normal":
		print("Finish")
