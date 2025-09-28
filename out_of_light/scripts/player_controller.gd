extends Node2D

const room_scenes : Array[PackedScene] = [
	preload("res://scenes/rooms/bathroom.tscn"),
	preload("res://scenes/rooms/bedroom.tscn"),
	preload("res://scenes/rooms/kitchen.tscn"),
	preload("res://scenes/rooms/living_room.tscn"),
	preload("res://scenes/rooms/stairs_bottom.tscn"),
	preload("res://scenes/rooms/stairs_middle.tscn"),
	preload("res://scenes/rooms/stairs_upper.tscn"),
	preload("res://scenes/rooms/observation_deck.tscn")
]

var current_room := RoomsEnum.Rooms.BEDROOM

var has_matchbox := false

var has_batteries := false

var has_glasses := false

var has_razor := false

var has_key := false

var has_fuse := false

var has_flashlight := false

var is_phone_powered := false

var i_love_my_son := false
