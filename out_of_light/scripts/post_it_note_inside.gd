extends TextureRect

func _ready() -> void:
	$AudioStreamPlayer.play()

func _on_close_button_pressed() -> void:
	queue_free()
