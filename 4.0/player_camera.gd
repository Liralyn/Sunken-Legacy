class_name PlayerCamera
extends Camera2D

@export var tilemap: TileMap  # assign in editor or find automatically

func _ready() -> void:
	setup_camera_limits(tilemap.get_used_rect())

func setup_camera_limits(rect: Rect2) -> void:
	limit_left = rect.position.x
	limit_right = (rect.position.x + rect.size.x) * 16
	limit_bottom = (rect.position.y + rect.size.y) * 16


func _on_item_rect_changed() -> void:
	pass # Replace with function body.
