class_name PlayerTrackingComponent
extends Node


@export var orientation_component : OrientationComponent
@export var velocity_component : VelocityComponent
@export var agent: Node2D

var target : Node2D


func _process(_delta: float) -> void:
	if is_instance_valid(target) and target is Player:
		orientation_component.orientation = Utils.inverse_transform_matrix * (
			target.global_position
			- agent.global_position
		)
	else:
		orientation_component.orientation = velocity_component.velocity
