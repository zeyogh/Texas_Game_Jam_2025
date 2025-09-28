class_name Flashlight
extends Control

@onready var battery1 : TextureButton = $Battery1
@onready var battery2 : TextureButton = $Battery2
@onready var flashlight : TextureRect = $Flashlight

var grabbingBattery1 : bool = false
var grabbingBattery2 : bool = false
var isBlurry : bool = !PlayerController.has_glasses

#call from game manager when inventory does not contain reading glasses
func LoadBlurred() -> void:
	battery1.texture = "res://resources/dummy/dummyBatteryBlurred.png"
	battery2.texture = "res://resources/dummy/dummyBatteryBlurred.png"
	isBlurry = true

#call from game manager when inventory contains reading glasses
func LoadClear() -> void:
	battery1.texture = "res://resources/dummy/dummyBattery.png"
	battery2.texture = "res://resources/dummy/dummyBattery.png"
	isBlurry = false

func FlipBattery1() -> void:
	if abs(battery1.position.x - 1340) < 15: battery1.flip_v = !battery1.flip_v
func FlipBattery2() -> void:
	if abs(battery2.position.x - 1720) < 15: battery2.flip_v = !battery2.flip_v

func GrabBattery1() -> void:
	if !isBlurry: grabbingBattery1 = true
func GrabBattery2() -> void:
	if !isBlurry and !battery1.visible: grabbingBattery2 = true

func _process(_delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if grabbingBattery1:
			battery1.global_position.x = get_global_mouse_position().x + battery1.texture_normal.get_width()/2
		elif grabbingBattery2:
			battery2.global_position.x = get_global_mouse_position().x + battery2.texture_normal.get_width()/2
	
	if Input.is_action_just_released("interact"):
		if grabbingBattery1 and get_global_mouse_position().x < flashlight.position.x + flashlight.texture.get_width():
			battery1.visible = false
		else:
			battery1.position.x = 1340
		if grabbingBattery2 and get_global_mouse_position().x < flashlight.position.x + flashlight.texture.get_width():
			battery2.visible = false
		else:
			battery2.position.x = 1720
		grabbingBattery1 = false
		grabbingBattery2 = false
		
	#do final puzzle check
	if !battery1.visible and !battery2.visible:
		if battery1.flip_v == battery2.flip_v:
			pass
		else:
			battery1.visible = true
			battery2.visible = true
			battery1.position.x = 475
			battery2.position.x = 1720
