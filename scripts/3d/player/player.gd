extends CharacterBody3D

signal set_movement_state(_movement_state: MovementState)
signal set_movement_direction(_movement_direction: Vector3)
signal pressed_jump(_jump_state: JumpState)

var movement_direction: Vector3

@export var movement_states: Dictionary
@export var jump_states: Dictionary

func _input(event: InputEvent) -> void:
	if event.is_action("movement"):
		movement_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		movement_direction.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
		
		if is_movement_ongoing():
			set_movement_state.emit(movement_states["run"])
		else:
			set_movement_state.emit(movement_states["idle"])

func _ready() -> void:
	set_movement_state.emit(movement_states["idle"])
	
func _physics_process(_delta: float) -> void:
	if is_movement_ongoing():
		set_movement_direction.emit(movement_direction)
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			pressed_jump.emit(jump_states["jump"])

func is_movement_ongoing():
	return abs(movement_direction.x) > 0 or abs(movement_direction.z) > 0 
