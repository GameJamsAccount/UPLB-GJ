extends Node

const char_start_pos:= Vector2i(150,485)
const cam_start_post:= Vector2i(900,324)

var speed: float
const start_speed:float=10.0
const max_speed: int=25
var screen_size:Vector2i

func _ready():
	screen_size=get_window().size
	new_game()
	
func new_game():
	$Character.position = char_start_pos
	$Character.velocity = Vector2i(0,0)
	$Camera2D.position = cam_start_post
	$StaticBody2D.position = Vector2i(0,0)

func _process(delta):
	speed = start_speed
	
	$Character.position.x +=speed
	$Camera2D.position.x +=speed
	if $Camera2D.position.x - $StaticBody2D.position.x > screen_size.x * 1.5:
		$StaticBody2D.position.x += screen_size.x
