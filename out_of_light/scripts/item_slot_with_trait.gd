class_name ItemSlotWithTrait
extends ItemSlot

var item_trait_type: int
var item_trait: int
	
func print_values():
	print(item_trait_type, item_trait)
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if self.get_child_count() > 0:
		return
	
	var full_data = data.get_parent()
	
	var draggable_items_container = full_data.get_parent()
	if draggable_items_container:
		draggable_items_container.remove_child(full_data)
	self.add_child(full_data)
	data.slot = self
	
