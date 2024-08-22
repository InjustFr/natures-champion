class_name EightDirectionAnimatedSpriteComponent
extends AnimatedSprite2D


@export var _orientation_component: OrientationComponent

@export var animation_name: String = "walk"
@export var zero_vector: Vector2 = Vector2(1, 0)


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	stats_component.stats_changed.connect(_on_stats_changed)
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


@export var stats_component: StatsComponent

func _on_stats_changed(new_stats: Stats) -> void:
	sprite_frames = new_stats.texture
