extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
