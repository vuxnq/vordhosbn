extends Window

@onready var Camera : Camera2D = $Camera2D

var last_position = Vector2i.ZERO
var velocity = Vector2i.ZERO

func _ready() -> void:
	Camera.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT
	
	transient = true
	close_requested.connect(queue_free)

func _process(delta: float) -> void:
	velocity = position - last_position
	last_position = position
	Camera.position = get_camera_post_from_window()

func get_camera_post_from_window() -> Vector2i:
	return (position + velocity) / Vector2i(Camera.zoom)
