extends Area2D

func _process(_delta: float) -> void:
	if(get_overlapping_bodies().size() > 0 and GlobalVariables.isAlive):
		for body in get_overlapping_bodies():
			if(body is Bubble and body.newBubble == false):
				GlobalVariables.isAlive = false
				get_tree().change_scene_to_file("res://GameOver/GameOver.tscn")
