extends Control

func _ready() -> void:
	if PlayerController.has_flashlight:
		$FlashlightButton.visible = false

func _on_opposite_button_pressed() -> void:
	$CabinetButton.visible = true
	if !PlayerController.has_flashlight:
		$FlashlightButton.visible = false
	
func _on_front_button_pressed() -> void:
	$CabinetButton.visible = false
	if !PlayerController.has_flashlight:
		$FlashlightButton.visible = true

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/kitchen_cabinet.tscn")

func _on_flashlight_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/puzzles/Flashlight.tscn")
