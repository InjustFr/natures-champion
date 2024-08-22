class_name WeaponComponent
extends Node


var weapon: Weapon
@export var spawning_entity: Node2D

@export var stats_component: StatsComponent

func _ready() -> void:
	@warning_ignore("return_value_discarded")
	stats_component.stats_changed.connect(_on_stats_changed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		weapon.attack(spawning_entity)


func _on_stats_changed(new_stats: Stats) -> void:
	weapon = new_stats.weapon.instantiate();
	add_child(weapon)
