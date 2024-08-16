class_name IsometricAnimatedSpriteComponent
extends AnimatedSprite2D


@export var _orientation_component: OrientationComponent

@export var animation_name: String = "walk"
@export var zero_vector: Vector2 = Vector2(1, 0)


func _ready() -> void:
	transform = Utils.inverse_transform_matrix * transform
	play()


func _physics_process(_delta: float) -> void:
	animation = animation_name + str(_determine_animation_index())


func _determine_animation_index() -> int:
	var angle: float = zero_vector.angle_to(_orientation_component.orientation)
	if angle < 0:
		angle = angle + 2 * PI

	var index: int = roundi((angle) / (PI / 4))

	index %= 8

	return index
