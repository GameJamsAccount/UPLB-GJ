extends CharacterBody2D


@onready var healthbar =$Healthbar2

const GRAVITY : int  = 4200
const JUMP_SPD: int = -1800
var can_attack = true

var maxHealth = 100
var health = 98

func _ready():
	healthbar.set_health_bar(health, maxHealth)

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	$Area2D/Attack1.disabled=true
	$Area2D/Attack2.disabled=true
	if Input.is_action_pressed("MainAction"):
		$AnimatedSprite2D/AnimatedSprite2D3.play("default")
		$Area2D/Attack1.disabled=false
	if can_attack:
		if Input.is_action_pressed("SecondaryAction"):
			$AnimatedSprite2D/AnimatedSprite2D3.play("thrust")
			$Area2D/Attack2.disabled=false
			can_attack = false
			$Timer.start()
		elif Input.is_action_pressed("Seed1"):
			$AnimatedSprite2D/AnimatedSprite2D4.play("grow")
			can_attack = false
			$Timer.start()
		elif Input.is_action_pressed("Water2"):
			$AnimatedSprite2D/AnimatedSprite2D2.play("Water")
			can_attack = false
			$Timer.start()
	
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

func _on_timer_timeout():
	can_attack = true
	
func take_damage(damage:int):
	health -= damage
	if health < 0: get_tree().change_scene_to_file("res://game_over.tscn")
	healthbar.change_health(-damage)
	
	
