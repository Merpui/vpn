extends Node2D

@export var spawn_range: Vector2 = Vector2(200, 300)  # Range for spawn position (x and y)
@export var num_bubbles: int = 10  # Number of bubbles to spawn
@export var bubble_spacing: int = 100  # Space between bubbles (scaled size)

var bubble_scene

func _ready():
	bubble_scene = preload("res://Bubble/Bubble.tscn").duplicate(true)
	spawn_bubbles_in_row()

func spawn_bubbles_in_row():
	for i in range(num_bubbles):
		var spawn_x = spawn_range.x + i * (65 + bubble_spacing)

		var current_bubble = bubble_scene.instantiate()
		current_bubble.position = Vector2(spawn_x, spawn_range.y)
		current_bubble.object_type = randi_range(1, 3)
		add_child(current_bubble)
