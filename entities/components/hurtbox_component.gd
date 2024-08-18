class_name HurtboxComponent
extends Area2D


@export var health_component: ResourceComponent


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	area_entered.connect(_handle_collision)


func _handle_collision(body: Node2D) -> void:
	if body is not DamageComponent:
		return

	var damage_component: DamageComponent = body

	health_component.current -= damage_component.damage
