class_name ExitPoint
extends Area2D


@export var orientation: Utils.DoorOrientation

var active: bool = false


signal activated(orientation: Utils.DoorOrientation)


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	body_entered.connect(_on_body_entered)
	@warning_ignore("return_value_discarded")
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		active = true


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		active = false


func _unhandled_input(event: InputEvent) -> void:
	if active and event.is_action_pressed("interact"):
		activated.emit(orientation)
