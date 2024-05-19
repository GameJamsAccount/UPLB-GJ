extends Node

var emeny=preload("res://Scenes/enemy.tscn")
var sign=preload("res://Scenes/sign.tscn")
var block=preload("res://Scenes/blcok.tscn")
var obstacle_type:=[sign,block]
var obstacles: Array
var bird_height:= [200,390]

const char_start_pos:= Vector2i(150,700)
const cam_start_post:= Vector2i(900,324)

@onready var pause_menu = $Camera2D/PauseMenu
var paused = false

var score: int
var speed: float
const start_speed:float=10.0
const max_speed: int=25
var screen_size:Vector2i
var ground_height: int
var last_obs
var asd: int

func _ready():
	screen_size=get_window().size
	ground_height=$StaticBody2D.get_node("Sprite2D").texture.get_height()
	new_game()
	MainMenu.stop_music()
	
func new_game():
	score=0
	asd=0

	$Character.position = char_start_pos
	$Character.velocity = Vector2i(0,0)
	$Camera2D.position = cam_start_post
	$StaticBody2D.position = Vector2i(0,-25)
	

func _process(_delta):
	speed = start_speed
	generate_obs()
	$Character.position.x +=speed
	$Camera2D.position.x +=speed
	score+=1
	asd += speed
	show_score()
	if $Camera2D.position.x - $StaticBody2D.position.x > screen_size.x * 1.5:
		$StaticBody2D.position.x += screen_size.x
func generate_obs():
	if obstacles.is_empty() or last_obs.position.x < asd + randi_range(300,500):
		var obs_type = obstacle_type[randi()%obstacle_type.size()]
		var obs
		var max_obs=3
		for i in range(randi() % max_obs * 1):
			obs=obs_type.instantiate()
			var obs_height=obs.get_node("Sprite2D").texture.get_height()
			var obs_scale=obs.get_node("Sprite2D").scale
			var obs_x: int = screen_size.x + asd + 100 + (i*100)
			var obs_y: int = screen_size.y - ground_height - (obs_height * obs_scale.y / 2) + 5
			last_obs=obs
			add_obs(obs, obs_x, obs_y)
		if (randi()&2)==0:
			obs = emeny.instantiate()
			var obs_x : int = screen_size.x + asd +100
			var obs_y : int = bird_height[randi() % bird_height.size()]
			add_obs(obs,obs_x,obs_y)
			
func add_obs(obs,x,y):
	obs.position = Vector2i(x, y)
	add_child(obs)
	obstacles.append(obs)
		
func show_score():
	$HUD.get_node("Score").text="SCORE: " + str(score)
	
