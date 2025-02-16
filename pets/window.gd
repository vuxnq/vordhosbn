extends Window

@export var camera = Node
@export var character_size: Vector2i = Vector2i(128, 128)

@onready var window : Window = get_window()

func _ready() -> void:
	# setup the main window
	window.transparent_bg = true
	
	# fit the main window to the character
	window.min_size = character_size * Vector2i(camera.zoom)
	window.size = window.min_size
	
func _process(_delta: float) -> void:
	window.position = get_window_pos_from_camera()

func get_window_pos_from_camera() -> Vector2i:
	return (Vector2i(camera.global_position + camera.offset) - character_size / 2) * Vector2i(camera.zoom)
