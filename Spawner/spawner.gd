extends Node2D

@export var spawn_range: Vector2 = Vector2(500, 150)  # Range for spawn position (x and y)
@export var num_bubbles: int = 5  # Number of bubbles to spawn
@export var bubble_spacing: int = 50  # Space between bubbles (scaled size)

var bubble_scene

func _ready():
	bubble_scene = preload("res://Bubble/Bubble.tscn").duplicate(true)
	spawn_bubbles_in_row();

func startRound():
	randomize()  # Randomize RNG for varied results
	spawn_bubbles_in_row();
		

func spawn_bubbles_in_row():
	for i in range(num_bubbles):
		@warning_ignore("integer_division")
		var spawn_x = 300 + i * (700/num_bubbles) + randf_range(0, (700/num_bubbles));
		var spawn_y = randf_range(0, 50);
		
		var current_bubble = bubble_scene.instantiate()
		current_bubble.position = Vector2(spawn_x, spawn_y);
		current_bubble.object_type = randi_range(1, 3)
		add_child(current_bubble)
