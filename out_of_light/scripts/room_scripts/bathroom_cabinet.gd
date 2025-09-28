extends Control

func _ready() -> void:
	if PlayerController.has_razor:
		$RazorButton.visible = false

func _on_razor_button_pressed() -> void:
	PlayerController.has_razor = true
	$GrabAudio.play()
	$RazorButton.queue_free()
