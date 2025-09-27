extends Node2D

var json_path = "res://json/dialogue.json"

var dialogue: Array = []

func _ready() -> void:
	_load_json_file()
	pass
	
func _load_json_file():
	var file = FileAccess.open(json_path, FileAccess.READ)
	assert(file.file_exists(json_path), "File path does not exist")
	var json = file.get_as_text()
	var json_object = JSON.new()
	json_object.parse(json)
	dialogue = json_object.data
	
	#for element in dialogue:
		#var room = element["room"]
		#var progress = element["progress"]
		#var dialogue_array = element["dialogue_array"]
		#
		#print("Room:", room)
		#print("Progress:", progress)
		#print("Dialogue:", dialogue_array["p1"])
		#print("------")
	
func _call_post_it(room: String, progress: String):
	for element in dialogue:
		if element["room"] == room and element["progress"] == progress:
			var dialogue_array = element["dialogue_array"]
			var dialogue = dialogue_array["p1"]
			return dialogue
