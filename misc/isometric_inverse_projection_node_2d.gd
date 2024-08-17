class_name IsometricInverseProjectionNode2D
extends Node2D


func _ready() -> void:
	transform = Utils.inverse_transform_matrix * transform
