extends Node2D

@export var bubble_scene: PackedScene  # Reference to the Bubble scene
@export var spawn_range: Vector2 = Vector2(200, 300)  # Range for spawn position (x and y)
@export var num_bubbles: int = 10  # Number of bubbles to spawn
@export var bubble_spacing: float = 0.1  # Space between bubbles (scaled size)

func _ready():
	spawn_bubbles_in_row()

func spawn_bubbles_in_row():
	var bubble_instance = bubble_scene.instantiate()
	var bubble_sprite = bubble_instance.get_node("Bubble")
	var bubble_width = bubble_sprite.texture.get_width() * bubble_instance.size

	for i in range(num_bubbles):
		var spawn_x = spawn_range.x + i * bubble_width

		var current_bubble = bubble_scene.instantiate()
		current_bubble.position = Vector2(spawn_x, spawn_range.y)
		current_bubble.object_type = randi_range(1, 3)
		add_child(current_bubble)
