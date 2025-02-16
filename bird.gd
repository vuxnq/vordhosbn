extends CharacterBody2D

@export var speed = 200

func animate(delta):
	$Sprite.frame = ($Sprite.frame + int(delta * $Sprite.hframes)) % $Sprite.hframes
	$Sprite.flip_h = 1 if velocity.x == 1 else 0

func _ready() -> void:
	position = DisplayServer.screen_get_size() / 2
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-1, 1][randi() % 2]

func collision_handle():
	var screensize = DisplayServer.screen_get_size()
	if position.x + 64 >= screensize.x or position.x - 64 <= 0:
		velocity.x *= -1
	if position.y + 64 >= screensize.y or position.y - 64 <= 0:
		velocity.y *= -1

func _process(delta: float) -> void:
	animate(delta)
	move_and_collide(velocity * speed * delta)
	collision_handle()
