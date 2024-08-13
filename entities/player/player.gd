class_name Player
extends CharacterBody2D


@export var SPEED: float = 500.0

var _old_direction: Vector2 = Vector2.ZERO
@onready var _sprite: AnimatedSprite2D = %Sprite2D
@onready var _spell_sprite: Node2D = $Spell
@onready var _speed_component: SpeedComponent = $SpeedComponent


const transform_matrix: Transform2D = Transform2D(Vector2(1,0.5), Vector2(-1,0.5), Vector2(0,0))


func _ready() -> void:
	_sprite.play()


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_pressed("cast"):
		var rotation_matrix: Transform2D = Transform2D(direction.angle() - PI/4, Vector2(0,0))
		_spell_sprite.transform = transform_matrix * rotation_matrix
		direction = Vector2.ZERO

	direction.y = direction.y / 2 # conversion to iso

	if direction:
		_old_direction = direction;
		velocity = direction * _speed_component.speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	_sprite.animation = _determine_animation()

	@warning_ignore("return_value_discarded")
	move_and_slide()


func _determine_animation() -> String:
	var angle: float = _old_direction.angle()
	if angle < 0:
		angle = angle + 2 * PI

	var index: int = roundi((angle + PI/4) / (PI / 4))
	if index > 7:
		index = 0

	if velocity.length():
		return "walk"+str(index)

	return "idle"+str(index)
