extends Control

@export_file("*.tscn") var left_path: String
@export_file("*.tscn") var right_path: String

@onready var left_visible: bool = $LeftButton.visible
@onready var right_visible: bool = $RightButton.visible

func _on_left_button_pressed() -> void:
	get_tree().change_scene_to_file(left_path)

func _on_right_button_pressed() -> void:
	get_tree().change_scene_to_file(right_path)

func _on_opposite_button_pressed() -> void:
	$FrontTexture.visible = false
	$OppositeTexture.visible = true
	_set_visibility(false, false, false, true)

func _on_front_button_pressed() -> void:
	$FrontTexture.visible = true
	$OppositeTexture.visible = false
	_set_visibility(true, true, true, false)

func _set_visibility(left: bool, right: bool, opposite: bool, front: bool) -> void:
	if left_visible:
		$LeftButton.visible = left
	if right_visible:
		$RightButton.visible = right
	$OppositeButton.visible = opposite
	$FrontButton.visible = front
