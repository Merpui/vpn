extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Actions per Wave: " + str(GlobalVariables.actionsPerRound) + "\n Cost: " + str(GlobalVariables.aPRCost * pow(1.5, GlobalVariables.aPRLevel));
