class_name Player
extends CharacterBody2D


@export var SPEED: float = 500.0

var _old_direction: Vector2 = Vector2.ZERO
@onready var _sprite: AnimatedSprite2D = %Sprite2D
@onready var _spell_sprite: Node2D = $Spell
@onready var _speed_component: SpeedComponent = $SpeedComponent
@onready var _orientation_component: OrientationComponent = $OrientationComponent


func _ready() -> void:
	_sprite.transform = Utils.inverse_transform_matrix * Transform2D(0,Vector2(0,-178))
	_sprite.play()


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = _orientation_component.orientation
	if Input.is_action_pressed("cast"):
		_spell_sprite.rotation = direction.rotated(-PI/4).angle()
		direction = Vector2.ZERO

	if direction:
		_old_direction = direction;
		velocity = Utils.transform_matrix * direction.rotated(-PI/4) * _speed_component.speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	_sprite.animation = _determine_animation()

	@warning_ignore("return_value_discarded")
	move_and_slide()


func _determine_animation() -> String:
	var angle: float = (_old_direction).angle()
	if angle < 0:
		angle = angle + 2 * PI

	var index: int = roundi((angle) / (PI / 4))

	index += 1
	index %= 8

	if velocity.length():
		return "walk"+str(index)

	return "idle"+str(index)
