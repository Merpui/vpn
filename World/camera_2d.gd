extends Camera2D


func _process(_delta: float) -> void:
	if(!GlobalVariables.isAlive):
		self.position = Vector2(4000, self.position.y);
