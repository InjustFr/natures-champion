extends NavigationAgent2D


class_name PathfindingComponent


@export var velocity_component : VelocityComponent
@export var speed_component : SpeedComponent
@export var agent: Node2D

var target : Vector2 = Vector2.INF


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	velocity_computed.connect(_safe_velocity_calculated)
	max_speed = speed_component.speed


func _physics_process(_delta: float) -> void:
	if target == Vector2.INF:
		return

	target_position = target

	var current_agent_position: Vector2 = agent.global_position
	var next_path_position: Vector2 = get_next_path_position()

	set_velocity(current_agent_position.direction_to(next_path_position) * speed_component.speed)


func _safe_velocity_calculated(safe_velocity: Vector2) -> void:
	velocity_component.velocity = safe_velocity
