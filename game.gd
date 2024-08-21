class_name Game
extends Node


@onready var room_scene: PackedScene = preload("res://stages/room.tscn")

var player: Player
var current_room: Room = null

@onready var map: Node2D = $Map


func _ready() -> void:
	var player_scene: PackedScene = load("res://entities/player/player.tscn")
	player = player_scene.instantiate()
	add_child(player)

	change_room(Utils.DoorOrientation.RIGHT)


func change_room(door_orientation: Utils.DoorOrientation) -> void:
	var new_room: Room = room_scene.instantiate();
	if current_room:
		current_room.queue_free()

	map.add_child(new_room)
	current_room = new_room

	var entry_point: EntryPoint = new_room.entry_points.pick_random()
	while entry_point.orientation != door_orientation:
		entry_point = new_room.entry_points.pick_random()

	for exit_point: ExitPoint in new_room.exit_points:
		@warning_ignore("return_value_discarded")
		exit_point.activated.connect(change_room)

	player.global_position = entry_point.global_position
