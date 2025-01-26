extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	$Label2.text = "Bubble Max Size: " + str(GlobalVariables.bubbleSize) + "\n Cost: " + str(GlobalVariables.bSCost * pow(1.5, GlobalVariables.bSLevel));


func _button_pressed():
	if(GlobalVariables.curMoney > GlobalVariables.bSCost * pow(1.5, GlobalVariables.bSLevel)):
		GlobalVariables.bubbleSize = GlobalVariables.bubbleSize + 1;
		GlobalVariables.curMoney = GlobalVariables.curMoney - (GlobalVariables.bSCost * pow(2, GlobalVariables.bSLevel));
		GlobalVariables.bSLevel = GlobalVariables.bSLevel + 1;
		$Label2.text = "Bubble Max Size: " + str(GlobalVariables.bubbleSize) + "\n Cost: " + str(GlobalVariables.bSCost * pow(1.5, GlobalVariables.bSLevel));
