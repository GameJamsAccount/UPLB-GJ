extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= get_parent().speed/4



func _on_dmg_box_body_entered(body):
	if "$Area2D/Attack1" in body.name:
		queue_free()


func _on_body_entered(body):
	if "Character" in body.name:
		body.take_damage(10)
