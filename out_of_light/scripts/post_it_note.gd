extends TextureButton

@export var font_size = 82

var inside = preload("res://scenes/post_it_note_inside.tscn")

var post_it_text: String = ""

var progress_stage = ProgressController.current_stage

var inside_opened := false

func _on_pressed() -> void:
	if post_it_text.length() == 0 || progress_stage != ProgressController.current_stage:
		var current_room = PlayerController.current_room
		var room_as_string = ""
		
		var current_phase = ProgressController.current_stage
		var phase_as_string = ""
		
		match current_room:
			RoomsEnum.Rooms.BATHROOM:
				room_as_string = "Bathroom"
			RoomsEnum.Rooms.BEDROOM:
				room_as_string = "Bedroom"
			RoomsEnum.Rooms.KITCHEN:
				room_as_string = "Kitchen"
			RoomsEnum.Rooms.LIVING_ROOM:
				room_as_string = "LivingRoom"
			RoomsEnum.Rooms.STAIRS_BOTTOM:
				room_as_string = "StairsLower"
			RoomsEnum.Rooms.STAIRS_MIDDLE:
				room_as_string = "StairsMiddle"
			RoomsEnum.Rooms.STAIRS_UPPER:
				room_as_string = "StairsUpper"
			RoomsEnum.Rooms.OBSERVATION_DECK:
				room_as_string = "ObservationDeck"
			_:
				room_as_string = "Bedroom"
				
		match current_phase:
			ProgressEnum.Progress.INTRO:
				phase_as_string = "intro"
			ProgressEnum.Progress.STAGE_1:
				phase_as_string = "stage_1"
			ProgressEnum.Progress.STAGE_2:
				phase_as_string = "stage_2"
			ProgressEnum.Progress.STAGE_3:
				phase_as_string = "stage_3"
			ProgressEnum.Progress.STAGE_4:
				phase_as_string = "stage_4"
			ProgressEnum.Progress.STAGE_5:
				phase_as_string = "stage_5"
			ProgressEnum.Progress.OUTRO:
				phase_as_string = "outro"
			_:
				phase_as_string = "intro"
			
		var text = PostItController._call_post_it(room_as_string, phase_as_string)
		post_it_text = text
		progress_stage = ProgressController.current_stage
		
	if !inside_opened:
		var instance = inside.instantiate()
		add_child(instance)
		instance.global_position = Vector2(450, 50)
		instance.get_node("Writing").add_theme_font_size_override("normal_font_size", font_size)
		instance.get_node("Writing").text = post_it_text
		inside_opened = true
