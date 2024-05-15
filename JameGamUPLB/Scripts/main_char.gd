extends CharacterBody2D

@export var max_speed: int = 25000
var speed: int = max_speed
@onready var animation = $AnimationPlayer

func _process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	
	if Input.is_action_pressed("Left"):
		$Sprite2D.flip_h = true
		animation.play("Running")
		velocity = direction * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("Right"):
		$Sprite2D.flip_h = false
		animation.play("Running")
		velocity = direction * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("Up"):
		animation.play("Running")
		velocity = direction * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("Down"):
		animation.play("Running")
		velocity = direction * speed * delta
		move_and_slide()
	else:
		animation.play("Idle")
	
	

