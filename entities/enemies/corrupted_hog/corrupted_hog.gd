class_name CorruptedHog
extends CharacterBody2D


@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var eight_direction_animated_sprite_component: EightDirectionAnimatedSpriteComponent = $EightDirectionAnimatedSpriteComponent
@onready var player_detect_area_2d: Area2D = $PlayerDetectArea2D
@onready var player_tracking_component: PlayerTrackingComponent = $PlayerTrackingComponent
@onready var pathfinding_component: PathfindingComponent = $PathfindingComponent
@onready var line_2d: Line2D = $Line2D

var player: Player

var state_machine: StateMachine = StateMachine.new()

func _ready() -> void:
	@warning_ignore("return_value_discarded")
	player_detect_area_2d.body_entered.connect(_on_player_entered)
	@warning_ignore("return_value_discarded")
	player_detect_area_2d.body_exited.connect(_on_player_exited)

	state_machine.add_state("idle", _idle, _idle_enter, Callable())
	state_machine.add_state("follow", _follow, Callable(), Callable())
	state_machine.set_initial_state("idle")


func _process(_delta: float) -> void:
	if player:
		player_tracking_component.target = player
		pathfinding_component.target = player.global_position


func _physics_process(_delta: float) -> void:
	line_2d.transform = Utils.transform_matrix * Transform2D(orientation_component.orientation.angle(), Vector2(0,0))
	state_machine.update()

	eight_direction_animated_sprite_component.animation_name = "idle"
	if velocity:
		eight_direction_animated_sprite_component.animation_name = "walk"

	@warning_ignore("return_value_discarded")
	move_and_slide()


func _on_player_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		state_machine.change_state("follow")


func _on_player_exited(body: Node2D) -> void:
	if body is Player:
		player = null
		state_machine.change_state("idle")


func _idle_enter() -> void:
	velocity_component.velocity = Vector2(0,0)
	velocity = Vector2(0,0)
	player_tracking_component.target = null
	pathfinding_component.target = Vector2.INF


func _idle() -> void:
	pass


func _follow() -> void:
	if player:
		player_tracking_component.target = player
		pathfinding_component.target = player.global_position

	velocity = velocity_component.velocity
