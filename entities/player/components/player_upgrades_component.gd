class_name PlayerUpgradesComponent
extends Node


var upgrades: Array[PlayerUpgrade] = []

@export var stats_component: StatsComponent
@export var player: Player


func apply_upgrade(upgrade: PlayerUpgrade) -> void:
	stats_component.add_stats_upgrade(upgrade.stats)
	stats_component.add_form_stats_upgrade(upgrade.form_stats)

	if upgrade.upgrade_script:
		var upgrade_script: PlayerUpgradeScript = upgrade.upgrade_script.new()
		upgrade_script.on_add(player)

	upgrades.push_back(upgrade)


func remove_upgrade(upgrade: PlayerUpgrade) -> void:
	var index: int = upgrades.find(upgrade)
	if index == -1:
		return

	stats_component.remove_stats_upgrade(upgrade.stats)
	stats_component.remove_form_stats_upgrade(upgrade.form_stats)

	upgrades.remove_at(index)

	if upgrade.upgrade_script:
		var upgrade_script: PlayerUpgradeScript = upgrade.upgrade_script.new()
		upgrade_script.on_remove(player)
