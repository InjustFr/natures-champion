class_name DashingComponent
extends Timer

@export var stats_component: StatsComponent

@export var dash_multiplier: float = 1.5;


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	timeout.connect(_end_dash)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dash") and is_stopped():
		_start_dash()

func _start_dash() -> void:
	stats_component.stats.speed = stats_component.stats.speed * dash_multiplier
	start()


func _end_dash() -> void:
	stats_component.stats.speed = stats_component.stats.speed / dash_multiplier
