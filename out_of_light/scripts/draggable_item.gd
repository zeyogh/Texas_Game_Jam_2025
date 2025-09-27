class_name DraggableItem
extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var tr: TextureRect = TextureRect.new()
	tr.texture = texture
	tr.modulate = Color(1, 1, 1, 0.5)
	set_drag_preview((tr))
	return self
