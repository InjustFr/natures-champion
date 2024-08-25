class_name StatsComponent
extends Node


signal stats_changed(new_stats: Stats)

var base_stats: Stats
@export var stats: Stats:
	set(s):
		base_stats  = s
		stats_changed.emit(_calculate_stats())
	get():
		return _calculate_stats()

var stats_upgrade: Array[Stats] = []
var form_stats_upgrade: Array[Stats] = []


func _calculate_stats() -> Stats:
	var upgrades: Array[Stats] = stats_upgrade
	if base_stats.transformation_stats:
		upgrades = form_stats_upgrade

	var total_stats: Stats = base_stats.duplicate()

	for s: Stats in upgrades:
		total_stats.speed += s.speed

	return total_stats


func add_stats_upgrade(upgrade: Stats) -> void:
	stats_upgrade.push_back(upgrade)
	stats_changed.emit(_calculate_stats())


func remove_stats_upgrade(upgrade: Stats) -> void:
	var index: int = stats_upgrade.find(upgrade)
	if index == 1:
		return

	stats_upgrade.remove_at(index)
	stats_changed.emit(_calculate_stats())


func add_form_stats_upgrade(upgrade: Stats) -> void:
	stats_upgrade.push_back(upgrade)
	stats_changed.emit(_calculate_stats())


func remove_form_stats_upgrade(upgrade: Stats) -> void:
	var index: int = stats_upgrade.find(upgrade)
	if index == 1:
		return

	stats_upgrade.remove_at(index)
	stats_changed.emit(_calculate_stats())
