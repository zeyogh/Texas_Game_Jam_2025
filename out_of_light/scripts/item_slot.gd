class_name ItemSlot
extends TextureButton
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is DraggableItem
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if self.get_child_count() > 0:
		return
	
	var draggable_items_container = data.get_parent()
	if draggable_items_container:
		draggable_items_container.remove_child(data)
	self.add_child(data)
	
 
