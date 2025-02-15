extends Sprite2D

var dragging = false
var drag_offset = Vector2(0, 0)

func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - drag_offset

func _on_drag_button_down() -> void:
	dragging = true
	drag_offset = get_global_mouse_position() - global_position

func _on_drag_button_up() -> void:
	dragging = false
