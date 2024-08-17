class_name ResourceBarComponent
extends ProgressBar


@export var resource_component: ResourceComponent

func _ready() -> void:
	min_value = 0
	max_value = resource_component.value_max


func _physics_process(_delta: float) -> void:
	value = resource_component.current
