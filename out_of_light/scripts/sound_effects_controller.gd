extends Node2D

const dark_color : Color = Color(.1,.1,.1)

func _on_timer_timeout() -> void:
	$ThunderSounds.play()
	_do_lightning()

func _do_lightning() -> void:
	var darkness : CanvasModulate = $CanvasModulate
	await get_tree().create_timer(0.35).timeout
	darkness.color = Color.WHITE
	await get_tree().create_timer(0.15).timeout
	darkness.color = dark_color
	await get_tree().create_timer(0.75).timeout
	darkness.color = Color.WHITE
	await get_tree().create_timer(0.1).timeout
	darkness.color = dark_color
	await get_tree().create_timer(0.15).timeout
	darkness.color = Color.WHITE
	await get_tree().create_timer(0.2).timeout
	darkness.color = dark_color
