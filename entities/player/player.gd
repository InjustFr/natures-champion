class_name Player
extends CharacterBody2D


@onready var _sprite: IsometricAnimatedSpriteComponent = %Sprite2D
@onready var _spell_sprite: Node2D = $Spell
@onready var _velocity_component: VelocityComponent = $VelocityComponent
@onready var _orientation_component: OrientationComponent = $OrientationComponent
@onready var line: Line2D = $Line2D

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = _orientation_component.orientation
	line.rotation = _orientation_component.orientation.angle()


	if Input.is_action_pressed("cast"):
		_spell_sprite.rotation = direction.angle()
		_velocity_component.velocity = Vector2.ZERO

	velocity = _velocity_component.velocity

	_sprite.animation_name = "idle"
	if velocity:
		_sprite.animation_name = "walk"

	@warning_ignore("return_value_discarded")
	move_and_slide()
