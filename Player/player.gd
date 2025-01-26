extends Node2D

@export var shoot_speed: float = 1000

@onready var globalVars = get_node('/root/GlobalVariables');

var bubble_scene
var current_bubble: Bubble = null

func _ready():
	bubble_scene = preload("res://Bubble/Bubble.tscn").duplicate(true)
	prepare_new_bubble()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if current_bubble:
				shoot_bubble()

func prepare_new_bubble():
	current_bubble = bubble_scene.instantiate() as Bubble
	current_bubble.newBubble = true;
	current_bubble.object_type = randi_range(1, 3)
	add_child(current_bubble)

	current_bubble.update_size()

func shoot_bubble():
	if current_bubble:
		globalVars.isShooting = true;
		var mouse_position = get_global_mouse_position()
		var direction = (mouse_position - current_bubble.global_position).normalized()

		current_bubble.linear_velocity = direction * shoot_speed
		current_bubble = null

		await get_tree().create_timer(0.5).timeout
		
		for shotBubble in get_children():
			shotBubble.newBubble = false;
		
		globalVars.isShooting = false;
		prepare_new_bubble()
