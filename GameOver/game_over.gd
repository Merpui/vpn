extends Node2D


func _ready() -> void:
	$Score.update_score()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://World/world.tscn")
