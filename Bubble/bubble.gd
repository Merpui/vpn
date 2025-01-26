extends RigidBody2D

class_name Bubble

@export var newBubble = false;
@export var object_type: int = 1
@export var growth_size: float = 0.05
@export var growth_factor: float = 0.05
@export var max_size: float = 0.2
@export var size_factor: int = 650

@onready var bubble_sprite = $Bubble
@onready var icon_sprite = $Icon
@onready var collision_shape = $CircleShape

var target_size: float = 0.0
var is_merging: bool = false

var icons: Array = []

func _ready():
	gravity_scale = 0  # Disable gravity
	contact_monitor = true  # Enable monitoring collisions
	max_contacts_reported = 1  # Limit to one contact per frame
	load_icons()
	update_size()
	update_color()
	set_icon()

func _physics_process(delta):
	if is_merging:
		grow_bubble(delta)

func merge_with(other: Bubble):
	if self.get_instance_id() > other.get_instance_id():
		# Ensure only one bubble handles the merge
		return
	
	# Start merging: Set target growth_size and initiate growth
	target_size = growth_size + other.growth_size
	is_merging = true

	# Remove the other bubble
	other.queue_free()

func grow_bubble(delta: float):
	if growth_size < target_size:
		growth_size = min(growth_size + growth_factor * delta, target_size)
		update_size()

	if growth_size >= target_size:
		is_merging = false

	if growth_size >= max_size:
		GlobalVariables.update_scores()
		queue_free()

func update_size():
	# Scale the sprite and collision shape to match the growth_size
	bubble_sprite.scale = Vector2(growth_size, growth_size)
	icon_sprite.scale = Vector2(growth_size, growth_size)
	collision_shape.shape.radius = growth_size * size_factor

func update_color():
	match object_type:
		1:
			bubble_sprite.modulate = Color(1, 0, 0)  # Red
		2:
			bubble_sprite.modulate = Color(0, 1, 0)  # Green
		3:
			bubble_sprite.modulate = Color(0, 0, 1)  # Blue
		_:
			bubble_sprite.modulate = Color(1, 1, 1)  # White (default)

func load_icons():
	var dir = DirAccess.open("res://Assets/Icons")
	if dir == null:
		print("Failed to open directory.")
		return
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if file_name.ends_with(".png"):
			var icon_texture = load("res://Assets/Icons/" + file_name)
			icons.append(icon_texture)
		file_name = dir.get_next()

func set_icon():
	if object_type >= 1 and object_type <= icons.size():
		icon_sprite.texture = icons[object_type - 1] 

# Handle collision
func _on_body_entered(body: Node):
	#print("Colliding...")
	if body is Bubble and not is_merging:
		if object_type == body.object_type:
			merge_with(body)
