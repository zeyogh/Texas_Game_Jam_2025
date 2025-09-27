extends Node2D

var json_path = "res://json/dialogue.json"

var dialogue: Array = []

func _ready() -> void:
	load_json_file()
	
func load_json_file():
	var file = FileAccess.open(json_path, FileAccess.READ)
	assert(file.file_exists(json_path), "File path does not exist")
	var json = file.get_as_text()
	var json_object = JSON.new()
	json_object.parse(json)
	dialogue = json_object.data
	
	for element in dialogue:
		var room = element["room"]
		var progress = element["progress"]
		var dialogue_array = element["dialogue_array"]
		
		print("Room:", room)
		print("Progress:", progress)
		print("Dialogue:", dialogue_array["p1"])
		print("------")
	
