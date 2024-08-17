extends CharacterBody3D

@export var speed = 7
@export var jump_strength = 20
@export var gravity = 50

var _velocity = Vector3.ZERO
var _snap_vector = Vector3.DOWN

@onready var _spring_arm = $SpringArm3D
@onready var _model = $Character
@onready var _animation_player = $Character/AnimationPlayer

func _physics_process(delta: float) -> void:
	var move_direction = Vector3.ZERO
	
	move_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_direction.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()

	
	_velocity.x = move_direction.x * speed
	_velocity.z = move_direction.z * speed
	_velocity.y -= gravity * delta

	var just_landed = is_on_floor() and _snap_vector == Vector3.ZERO
	var is_jumping = is_on_floor() and Input.is_action_just_pressed("jump")
	var is_falling = !is_on_floor() and _velocity.y < 0 
	
	if is_jumping:
		_velocity.y = jump_strength
		_snap_vector = Vector3.ZERO
		_animation_player.play("Jump")
	elif just_landed:
		_snap_vector = Vector3.DOWN
		_animation_player.stop()
	elif is_falling:
		_animation_player.play("Fall")
		
	velocity = _velocity
	move_and_slide()
	floor_snap_length = 0.1
		
	if Vector2(_velocity.z, _velocity.x).length() > 0.2:
		var look_direction = Vector2(_velocity.z, _velocity.x)
		if !is_playing_animation("Jump") and !is_playing_animation("Fall"):
			_animation_player.play("Run")
		_model.rotation.y = look_direction.angle()
	elif !is_playing_animation("Jump") and !is_playing_animation("Fall"):
		_animation_player.play("Idle")

func _process(_delta: float) -> void:
	_spring_arm.position = position
	
func is_playing_animation(name: String):
	return _animation_player.is_playing() and _animation_player.current_animation == name
	
