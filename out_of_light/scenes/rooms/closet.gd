extends Control

func _ready() -> void:
	if PlayerController.has_fuse:
		$FuseButton.visible = false

func _on_fuse_button_pressed() -> void:
	PlayerController.has_fuse = true
	$FuseButton.queue_free()
