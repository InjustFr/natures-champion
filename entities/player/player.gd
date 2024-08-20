class_name Player
extends CharacterBody2D


@onready var sprite: EightDirectionAnimatedSpriteComponent = %Sprite2D
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var health_component: ResourceComponent = $HealthComponent
@onready var mana_component: ResourceComponent = $ManaComponent
@onready var line: Line2D = $Line2D


func _physics_process(_delta: float) -> void:
	line.transform = Utils.transform_matrix * Transform2D(orientation_component.orientation.angle(), Vector2(0,0))

	if Input.is_action_just_pressed("cast"):
		health_component.current -= 5
		mana_component.current -= 4

	velocity = velocity_component.velocity

	sprite.animation_name = "idle"
	if velocity:
		sprite.animation_name = "walk"

	@warning_ignore("return_value_discarded")
	move_and_slide()
