extends Node2D

@export var bubble_scene: PackedScene
@export var spawn_count: int = 15

func _ready():
	randomize()  # Randomize RNG for varied results
	for i in range(spawn_count):
		spawn_bubble()

func spawn_bubble():
	var bubble = bubble_scene.instantiate().duplicate()
	bubble.position = Vector2(randi() % 1200, randi() % 600)
	
	bubble.object_type = randi() % 3 + 1
	bubble.velocity = Vector2(randf() * 500 - 100, randf() * 500 - 100)
	
	add_child(bubble)
