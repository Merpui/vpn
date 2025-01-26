extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	$Label2.text = "Actions per Turn: " + str(GlobalVariables.actionsPerRound) + "\n Cost: " + str(GlobalVariables.aPRCost * pow(1.5, GlobalVariables.aPRLevel));


func _button_pressed():
	if(GlobalVariables.curMoney > GlobalVariables.aPRCost * pow(1.5, GlobalVariables.aPRLevel)):
		GlobalVariables.actionsPerRound = GlobalVariables.actionsPerRound + 1;
		GlobalVariables.curMoney = GlobalVariables.curMoney - (GlobalVariables.aPRCost * pow(2, GlobalVariables.aPRLevel));
		GlobalVariables.aPRLevel = GlobalVariables.aPRLevel + 1;
		$Label2.text = "Actions per Turn: " + str(GlobalVariables.actionsPerRound) + "\n Cost: " + str(GlobalVariables.aPRCost * pow(1.5, GlobalVariables.aPRLevel));
