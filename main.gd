extends Node

@export_node_path("Camera2D") var main_camera : NodePath
@onready var MainCamera : Camera2D = get_node(main_camera)

@onready var MainWindow : Window = get_window()
@onready var SubWindow : Window = $Window

@export var character_size: Vector2i = Vector2i(128, 128)

@export_range(0, 19) var world_visibility_layer: int = 0
@export_range(0, 19) var character_visibility_layer: int = 1

func _ready() -> void:
	# setup the main window
	MainWindow.transparent_bg = true
	
	# fit the main window to the character
	MainWindow.min_size = character_size * Vector2i(MainCamera.zoom)
	MainWindow.size = MainWindow.min_size
	
	# visibility
	MainWindow.set_canvas_cull_mask_bit(world_visibility_layer, false)
	MainWindow.set_canvas_cull_mask_bit(character_visibility_layer, true)
	
	SubWindow.set_canvas_cull_mask_bit(world_visibility_layer, true)
	SubWindow.set_canvas_cull_mask_bit(character_visibility_layer, false)

	# set the subwindow's world
	SubWindow.world_2d = MainWindow.world_2d

func _process(delta: float) -> void:
	MainWindow.position = get_window_pos_from_camera()

func get_window_pos_from_camera() -> Vector2i:
	return (Vector2i(MainCamera.global_position + MainCamera.offset) - character_size / 2) * Vector2i(MainCamera.zoom)
