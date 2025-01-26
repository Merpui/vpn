extends Label

func _process(delta: float) -> void:
	text = "Money \n" + str(GlobalVariables.curMoney)
