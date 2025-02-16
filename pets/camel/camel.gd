extends CharacterBody2D

@export var sprite = Node
@export var speed = 60
@export var animation_speed = 20

var screensize = DisplayServer.screen_get_size()

var frame_timer = 0
func animate(delta):
	frame_timer += delta * animation_speed
	sprite.frame = int(frame_timer) % sprite.hframes
	sprite.flip_h = 1 if velocity.x == 1 else 0

func _ready() -> void:
	randomize()
	position = Vector2i(randi_range(64, screensize.x - 64), screensize.y - 64)
	velocity.x = [-1, 1][randi() % 2]

func collision_handle():
	if position.x + 64 >= screensize.x or position.x - 64 <= 0:
		velocity.x *= -1
	if position.y + 64 >= screensize.y or position.y - 64 <= 0:
		velocity.y *= -1

func _process(delta: float) -> void:
	animate(delta)
	move_and_collide(velocity * speed * delta)
	collision_handle()
