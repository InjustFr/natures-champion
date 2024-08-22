class_name Player
extends CharacterBody2D


@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var health_component: ResourceComponent = $HealthComponent
@onready var mana_component: ResourceComponent = $ManaComponent
@onready var line: Line2D = $Line2D
@onready var eight_direction_animated_sprite_component: EightDirectionAnimatedSpriteComponent = %EightDirectionAnimatedSpriteComponent


func _physics_process(_delta: float) -> void:
	line.transform = Utils.transform_matrix * Transform2D(orientation_component.orientation.angle(), Vector2(0,0))

	if Input.is_action_just_pressed("cast"):
		health_component.current -= 5
		mana_component.current -= 4

	velocity = velocity_component.velocity

	eight_direction_animated_sprite_component.animation_name = "idle"
	if velocity:
		eight_direction_animated_sprite_component.animation_name = "walk"

	@warning_ignore("return_value_discarded")
	move_and_slide()
