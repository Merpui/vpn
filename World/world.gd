extends Node2D

@export var action = 0;
@export var cur_round = 0;

func _ready() -> void:
	GlobalVariables.scores_updated.connect(Callable(self, "_on_scores_updated"))

func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton and GlobalVariables.isAlive:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and GlobalVariables.isShooting:
			action = action+1;
			if(action == GlobalVariables.actionsPerRound):
				cur_round = cur_round + 1;
				action = 0;
				for bubble in $Spawner.get_children():
					bubble.freeze = true
					bubble.global_position.y += 100
					bubble.linear_velocity = Vector2.ZERO
					bubble.gravity_scale = 0
					bubble.gravity_scale = 1
					bubble.freeze = false
				for bubble in $Player.get_children():
					if(bubble.linear_velocity.length() < 25):
						bubble.freeze = true
						bubble.global_position.y += 100
						bubble.linear_velocity = Vector2.ZERO
						bubble.gravity_scale = 0
						bubble.gravity_scale = 1
						bubble.freeze = false
				$Spawner.startRound();

#func _process(delta):
	#for bubbleCheck in $Spawner.get_children():
		#if(bubbleCheck.position.y >= 1000):
			#globalVars.isAlive = false;
	#for bubbleCheck in $Player.get_children():
		#if(bubbleCheck.position.y >= 1000):
			#globalVars.isAlive = false;


func _on_scores_updated():
	$Score.update_score()
