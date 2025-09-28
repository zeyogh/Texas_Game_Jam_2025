extends Control

func _ready() -> void:
	if PlayerController.has_batteries:
		$BatteriesButton.visible = false

func _on_batteries_button_pressed() -> void:
	PlayerController.has_batteries = true
	$GrabAudio.play()
	$BatteriesButton.queue_free()
