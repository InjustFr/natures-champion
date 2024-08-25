extends CollisionPolygon2D

var start_shape: PackedVector2Array = polygon;
@export var rotation_angle: float = 0


func _ready() -> void:
	start_shape = polygon


func _process(delta: float) -> void:
	var rotation_matrix: Transform2D = Transform2D(deg_to_rad(rotation_angle) - PI / 4, Vector2(0,0))
	var new_shape: PackedVector2Array
	for point in start_shape:
		var new_point := Utils.transform_matrix * rotation_matrix * point
		new_shape.push_back(new_point)

	polygon = new_shape
