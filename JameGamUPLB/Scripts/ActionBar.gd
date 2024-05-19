extends HBoxContainer
 
 
var skills : Array
@onready var debug = $"../Debug"
signal starttime

func _ready():
	skills = get_children()
	for i in get_child_count():
		skills[i].change_key = str(i+1)
		skills[i].cast.connect(_casted)
	starttime.emit() 

func _casted(spell_name):
	debug.text = spell_name
