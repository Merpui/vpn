extends Node

@export var isShooting = false;
@export var isAlive = true;
@export var inShop = false;

@export var actionsPerRound = 4;
@export var aPRCost = 10;
@export var aPRLevel = 1;

@export var bubbleSize = 1;
@export var bSCost = 25;
@export var bSLevel = 1;

@export var moneyPerPop = 5;
@export var mPPCost = 15;
@export var mPPLevel = 1;

@export var waveDistance = 100;
@export var wDCost = 10;
@export var wDLevel = 1;

@export var bubblesPerWave = 10;
@export var bPWCost = 20;
@export var bPWLevel = 1;

@export var scorePerPop = 5;

@export var curMoney: int = 0;
@export var curScore: int = 0;


@warning_ignore("unused_signal")
signal scores_updated


func update_scores():
	curMoney += moneyPerPop
	curScore += scorePerPop
	emit_signal("scores_updated")
