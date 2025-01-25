extends Area2D

class_name Bubble

@export var object_type: int = 1
@export var size: float = 0.1
@export var growth_factor : float = 0.5
@export var max_size: float = 0.5

@onready var bubble_sprite = $Bubble
@onready var icon_sprite = $Icon
@onready var collision_shape = $CollisionShape2D

const FRICTION: int = 50
const VELOCITY: int = 100

var velocity: Vector2 = Vector2.ZERO


func _ready():
	update_size()
	update_color()


func _physics_process(delta):
	position += velocity * delta
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)


func _on_area_entered(area: Area2D) -> void:
	if area is Bubble:
		if object_type == area.object_type:
			merge_with(area)
		else:
			collide_with(area)


func merge_with(other: Bubble):
	if self.get_instance_id() > other.get_instance_id():
		return
	size += other.size
	print("Size is now: ", size);
	update_size()

	other.queue_free()

	if size >= max_size:
		queue_free()


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
