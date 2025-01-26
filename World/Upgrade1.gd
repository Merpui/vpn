extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	$Label2.text = "Money per Bubble: " + str(GlobalVariables.moneyPerPop) + "\n Cost: " + str(GlobalVariables.mPPCost * pow(1.5, GlobalVariables.mPPLevel));


func _button_pressed():
	if(GlobalVariables.curMoney > GlobalVariables.mPPCost * pow(1.5, GlobalVariables.mPPLevel)):
		GlobalVariables.moneyPerPop = GlobalVariables.moneyPerPop + 1;
		GlobalVariables.curMoney = GlobalVariables.curMoney - (GlobalVariables.mPPCost * pow(2, GlobalVariables.mPPLevel));
		GlobalVariables.mPPLevel = GlobalVariables.mPPLevel + 1;
		$Label2.text = "Money per Bubble: " + str(GlobalVariables.moneyPerPop) + "\n Cost: " + str(GlobalVariables.mPPCost * pow(1.5, GlobalVariables.mPPLevel));
