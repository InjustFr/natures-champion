class_name AnimalTransformComponent
extends Node


@export var animal_transform: AnimalTransform
@export var stats_component: StatsComponent

@onready var transform_timer: Timer = $TransformTimer
@onready var cooldown_timer: Timer = $CooldownTimer

var untransformed_stats: Stats = null


func _ready() -> void:
	transform_timer.wait_time = animal_transform.duration
	cooldown_timer.wait_time = animal_transform.cooldown
	@warning_ignore("return_value_discarded")
	transform_timer.timeout.connect(_stop_transformation)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("transform") and transform_timer.is_stopped() and cooldown_timer.is_stopped():
		_start_transformation()


func _start_transformation() -> void:
	untransformed_stats = stats_component.stats
	stats_component.stats = animal_transform.stats
	transform_timer.start()


func _stop_transformation() -> void:
	stats_component.stats = untransformed_stats
	cooldown_timer.start()
