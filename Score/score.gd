extends Node2D

@onready var score = $Score

func _ready() -> void:
	score.text = str(0)


func update_score():
	score.text = str(GlobalVariables.curScore)
