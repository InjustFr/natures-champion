class_name StraightMovementComponent
extends Node


@export var speed_component: SpeedComponent
@export var velocity_component: VelocityComponent
@export var orientation_component: OrientationComponent


func _physics_process(_delta: float) -> void:
	velocity_component.velocity = orientation_component.orientation * speed_component.speed
