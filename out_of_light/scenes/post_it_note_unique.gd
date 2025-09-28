extends TextureButton

@export var font_size = 82

var inside = preload("res://scenes/post_it_note_inside.tscn")

@export var post_it_text: String = ""

func _on_pressed() -> void:
	var instance = inside.instantiate()
	add_child(instance)
	instance.global_position = Vector2(450, 50)
	instance.get_node("Writing").add_theme_font_size_override("normal_font_size", font_size)
	instance.get_node("Writing").text = post_it_text
