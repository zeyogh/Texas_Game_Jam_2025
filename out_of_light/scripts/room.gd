extends Control

@export_file("*.tscn") var left_path: String
@export_file("*.tscn") var right_path: String
@export_file("*.png", "*.jpg", "*.jpeg") var ceiling_path: String
@export_file("*.png", "*.jpg", "*.jpeg") var opposite_path: String

@onready var front_texture: Texture2D = $TextureRect.texture

func _on_left_button_pressed() -> void:
	get_tree().change_scene_to_file(left_path)

func _on_right_button_pressed() -> void:
	get_tree().change_scene_to_file(right_path)

func _on_ceiling_button_pressed() -> void:
	var tex := load(ceiling_path) as Texture2D
	$TextureRect.texture = tex
	_set_visibility(false, false, false, false, true)

func _on_opposite_button_pressed() -> void:
	var tex := load(opposite_path) as Texture2D
	$TextureRect.texture = tex
	_set_visibility(false, false, true, false, true)

func _on_front_button_pressed() -> void:
	$TextureRect.texture = front_texture
	_set_visibility(true, true, true, true, false)

func _set_visibility(left: bool, right: bool, ceiling: bool, opposite: bool, front: bool) -> void:
	$LeftButton.visible = left
	$RightButton.visible = right
	$CeilingButton.visible = ceiling
	$OppositeButton.visible = opposite
	$FrontButton.visible = front
