class_name WeaponComponent
extends Node


@export var weapon: Weapon
@export var spawning_entity: Node2D


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		weapon.attack(spawning_entity)
