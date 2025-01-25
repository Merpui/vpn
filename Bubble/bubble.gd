extends Area2D

class_name Bubble

@export var object_type: int = 1
@export var size: float = 0.1
@export var growth_factor : float = 0.05  # How much the size increases per frame
@export var max_size: float = 0.5

@onready var bubble_sprite = $Bubble
@onready var icon_sprite = $Icon
@onready var collision_shape = $CollisionShape2D

const FRICTION: int = 50
const VELOCITY: int = 100

var velocity: Vector2 = Vector2.ZERO
var is_merging: bool = false
var target_size: float = 0.0

var icons: Array = []

func _ready():
	load_icons()
	update_size()
	update_color()
	set_icon()

func _physics_process(delta):
	position += velocity * delta
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	# Grow the bubble if merging
	if is_merging:
		grow_bubble(delta)

func _on_area_entered(area: Area2D) -> void:
	if area is Bubble:
		if object_type == area.object_type:
			merge_with(area)
		else:
			collide_with(area)

func merge_with(other: Bubble):
	if self.get_instance_id() > other.get_instance_id():
		return

	# Start merging: Set target size and initiate growth
	target_size = size + other.size
	is_merging = true

	other.queue_free()

	if size >= max_size:
		queue_free()

func grow_bubble(delta: float):
	if size < target_size:
		# Increment size linearly over time
		size = min(size + growth_factor * delta, target_size)
		update_size()

	# Once it reaches the target size, stop merging
	if size >= target_size:
		is_merging = false

func update_size():
	scale = Vector2(size, size)

func collide_with(other):
	var collision_normal = (other.global_position - global_position).normalized()
	
	velocity = -collision_normal * VELOCITY
	other.velocity = collision_normal * VELOCITY

func update_color():
	match object_type:
		1:
			bubble_sprite.modulate = Color(1, 0, 0)
		2:
			bubble_sprite.modulate = Color(0, 1, 0)
		3:
			bubble_sprite.modulate = Color(0, 0, 1)
		_:
			bubble_sprite.modulate = Color(1, 1, 1)


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
