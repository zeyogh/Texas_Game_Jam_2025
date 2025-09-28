extends Control

func _ready() -> void:
	if PlayerController.has_glasses:
		$GlassesButton.visible = false

func _on_texture_button_pressed() -> void:
	PlayerController.has_glasses = true
	$GlassesButton.queue_free()
