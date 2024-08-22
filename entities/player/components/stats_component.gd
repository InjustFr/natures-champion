class_name StatsComponent
extends Node


signal stats_changed(new_stats: Stats)


@export var stats: Stats:
	set(s):
		stats = s
		stats_changed.emit(s)


func _ready() -> void:
	stats_changed.emit(stats)
