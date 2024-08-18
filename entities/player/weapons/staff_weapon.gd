class_name StaffWeapon
extends Weapon


@onready var projectile_scene: PackedScene = preload("res://entities/projectiles/staff_projectile/staff_projectile.tscn")


func attack(spawning_entity: Node2D) -> void:
	var projectile: Node2D = projectile_scene.instantiate()
	spawning_entity.get_parent().add_child(projectile)

	projectile.transform = spawning_entity.transform

	var projectile_orientation_component: OrientationComponent = projectile.find_children("*", "OrientationComponent")[0]

	var spawning_entity_matching_components: Array[Node] = spawning_entity.find_children("*", "OrientationComponent")
	if not spawning_entity_matching_components.size():
		projectile_orientation_component.orientation = Vector2.RIGHT.rotated(spawning_entity.rotation)

		return

	var spawning_entity_orientation_component: OrientationComponent = spawning_entity_matching_components[0]
	projectile_orientation_component.orientation = spawning_entity_orientation_component.orientation
