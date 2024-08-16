class_name PlayerInputComponent
extends Node


@export var _orientation_component: OrientationComponent;
@export var _velocity_component: VelocityComponent;
@export var _speed_component: SpeedComponent;


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").rotated(-PI/4)

	if direction:
		_orientation_component.orientation = direction
		_velocity_component.velocity = Utils.transform_matrix * direction * _speed_component.speed

		return

	_velocity_component.velocity.x = move_toward(_velocity_component.velocity.x, 0, _speed_component.speed)
	_velocity_component.velocity.y = move_toward(_velocity_component.velocity.y, 0, _speed_component.speed)
