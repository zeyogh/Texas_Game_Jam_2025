extends Control

static var can_play_jumpscare := true

func _ready() -> void:
	if PlayerController.has_razor and can_play_jumpscare:
		$MirrorButton/Person.texture = load("res://pictures/reflection_2.png")
		can_play_jumpscare = false
		
