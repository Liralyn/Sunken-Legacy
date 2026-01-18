extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_load_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://confirmation.tscn")
