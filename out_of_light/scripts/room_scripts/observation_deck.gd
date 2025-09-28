extends Control

func _ready() -> void:
	if PlayerController.has_key:
		$KeyButton.visible = false

func _on_opposite_button_pressed() -> void:
	if !PlayerController.has_key:
		$KeyButton.visible = false

func _on_front_button_pressed() -> void:
	if !PlayerController.has_key:
		$KeyButton.visible = true

func _on_key_button_pressed() -> void:
	PlayerController.has_key = true
	$KeyButton.queue_free()
