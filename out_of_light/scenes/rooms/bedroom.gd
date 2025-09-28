extends Control

func _on_opposite_button_pressed() -> void:
	$CandleButton.visible = true

func _on_front_button_pressed() -> void:
	$CandleButton.visible = false

func _on_candle_button_pressed() -> void:
	if PlayerController.has_matchbox:
		get_tree().change_scene_to_file("res://scenes/puzzles/Candles.tscn")
