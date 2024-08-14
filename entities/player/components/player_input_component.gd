class_name PlayerInputComponent
extends Node


@export var orientation_component: OrientationComponent;


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	orientation_component.orientation =  direction
