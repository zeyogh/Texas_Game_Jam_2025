extends Control

func _ready() -> void:
	if PlayerController.has_matchbox:
		$MatchboxButton.visible = false

func _on_matchbox_button_pressed() -> void:
	PlayerController.has_matchbox = true
	$MatchboxButton.queue_free()
