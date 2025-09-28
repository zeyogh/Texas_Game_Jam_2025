extends Control

func _ready() -> void:
	if PlayerController.has_fuse:
		$FuseButton.visible = false

func _on_fuse_button_pressed() -> void:
	PlayerController.has_fuse = true
	$FuseButton.queue_free()

func _on_breaker_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/puzzles/Chandelier.tscn")
