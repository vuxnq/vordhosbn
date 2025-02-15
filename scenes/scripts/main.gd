extends Node2D

@onready var spriteA : Sprite2D = $Icon

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	set_passthrough(spriteA)

func set_passthrough(sprite: Sprite2D):
	var sprite_center: Vector2 = sprite.texture.get_size() / 2
	var sprite_corners: PackedVector2Array = [
		sprite.global_position + sprite_center * Vector2(-1, -1),	# top-left
		sprite.global_position + sprite_center * Vector2(1, -1),	# top-right
		sprite.global_position + sprite_center * Vector2(1, 1),	# bottom-right
		sprite.global_position + sprite_center * Vector2(-1, 1)	# bottom-left
	]
	DisplayServer.window_set_mouse_passthrough(sprite_corners)
