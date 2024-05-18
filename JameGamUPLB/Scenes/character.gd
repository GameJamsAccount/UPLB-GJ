extends CharacterBody2D

const GRAVITY : int  = 4200
const JUMP_SPD: int = -1800

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if Input.is_action_pressed("EquipS"):
		if Input.is_action_pressed("MainAction"):
			$AnimatedSprite2D/AnimatedSprite2D2.play("default")
		elif Input.is_action_pressed("SecondaryAction"):
			$AnimatedSprite2D/AnimatedSprite2D2.play("thrust")
	if Input.is_action_pressed("EquipSeed"):
		if Input.is_action_pressed("MainAction"):
			$AnimatedSprite2D/AnimatedSprite2D3.play("grow")
		elif Input.is_action_pressed("SecondaryAction"):
			$AnimatedSprite2D/AnimatedSprite2D3.play("grow")
	if Input.is_action_pressed("EquipW"):
		if Input.is_action_pressed("MainAction"):
			$AnimatedSprite2D/AnimatedSprite2D.play("Water")
		elif Input.is_action_pressed("SecondaryAction"):
			$AnimatedSprite2D/AnimatedSprite2D.play("Water")
	
	if is_on_floor():
		$CollisionShape2D.disabled=false
		if Input.is_action_pressed("Up"):
			velocity.y = JUMP_SPD
		elif Input.is_action_pressed("Down"):
			$AnimatedSprite2D.play("roll")
			$CollisionShape2D.disabled=true
		else:
			$AnimatedSprite2D.play("Run")
	else:
		$AnimatedSprite2D.play("Jump")
	move_and_slide()
