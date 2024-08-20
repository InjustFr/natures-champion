extends StaticBody2D


@onready var velocity_component: VelocityComponent = $VelocityComponent

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity_component.velocity * delta)
	if collision:
		queue_free()
