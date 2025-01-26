extends StaticBody2D


func _on_mouse_entered() -> void:
	GlobalVariables.inShop = true;


func _on_mouse_exited() -> void:
	GlobalVariables.inShop = false;
