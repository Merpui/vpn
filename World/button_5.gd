extends Button

func _ready() -> void:
	self.pressed.connect(self._button_pressed)
	$Label2.text = "Reduce Movement per Wave:  " + str(GlobalVariables.waveDistance) + "\n Cost: " + str(GlobalVariables.wDCost * pow(1.5, GlobalVariables.wDLevel));


func _button_pressed():
	if(GlobalVariables.curMoney > GlobalVariables.wDCost * pow(1.5, GlobalVariables.wDLevel)):
		GlobalVariables.waveDistance = GlobalVariables.waveDistance * 0.9;
		GlobalVariables.curMoney = GlobalVariables.curMoney - (GlobalVariables.wDCost * pow(2, GlobalVariables.wDLevel));
		GlobalVariables.wDLevel = GlobalVariables.wDLevel + 1;
		$Label2.text = "Reduce Movement per Wave:  " + str(GlobalVariables.waveDistance) + "\n Cost: " + str(GlobalVariables.wDCost * pow(1.5, GlobalVariables.wDLevel));
