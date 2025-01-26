extends Node

@export var isShooting = false;
@export var isAlive = true;

@export var actionsPerRound = 4;
@export var bubbleSpeed = 40;
@export var moneyPerPop = 10;
@export var scorePerPop = 5;

@export var curMoney: int = 0;
@export var curScore: int = 0;

@warning_ignore("unused_signal")
signal scores_updated


func update_scores():
	curMoney += moneyPerPop
	curScore += scorePerPop
	emit_signal("scores_updated")
