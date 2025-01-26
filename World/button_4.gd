extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	$Label2.text = "Reduce bubble Number per Wave:  " + str(GlobalVariables.bubblesPerWave) + "\n Cost: " + str(GlobalVariables.bPWCost * pow(1.5, GlobalVariables.bPWLevel));


func _button_pressed():
	if(GlobalVariables.curMoney > GlobalVariables.bPWCost * pow(1.5, GlobalVariables.bPWLevel)):
		GlobalVariables.bubblesPerWave = GlobalVariables.bubblesPerWave - 1;
		GlobalVariables.curMoney = GlobalVariables.curMoney - (GlobalVariables.bPWCost * pow(3, GlobalVariables.bPWLevel));
		GlobalVariables.bPWLevel = GlobalVariables.bPWLevel + 1;
		$Label2.text = "Reduce bubble Number per Wave:  " + str(GlobalVariables.bubblesPerWave) + "\n Cost: " + str(GlobalVariables.bPWCost * pow(1.5, GlobalVariables.bPWLevel));
