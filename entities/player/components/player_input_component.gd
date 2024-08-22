class_name PlayerInputComponent
extends Node


@export var orientation_component: OrientationComponent;
@export var velocity_component: VelocityComponent;
@export var stats_component: StatsComponent;


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").rotated(-PI/4)

	if direction:
		orientation_component.orientation = direction
		velocity_component.velocity = Utils.transform_matrix * direction * stats_component.stats.speed

		return

	velocity_component.velocity.x = move_toward(velocity_component.velocity.x, 0, stats_component.stats.speed)
	velocity_component.velocity.y = move_toward(velocity_component.velocity.y, 0, stats_component.stats.speed)
