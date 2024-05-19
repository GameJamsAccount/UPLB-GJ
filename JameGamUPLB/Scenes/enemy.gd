extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.x -= get_parent().speed/4


func _on_body_entered(body):
	queue_free()
