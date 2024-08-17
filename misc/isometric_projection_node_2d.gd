class_name IsometricProjectionNode2D
extends Node2D


func _ready() -> void:
	transform = Utils.transform_matrix * transform
