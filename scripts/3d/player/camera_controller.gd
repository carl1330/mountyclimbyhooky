extends Node3D

signal set_cam_rotation(_cam_rotation: float)

@onready var yaw_node = $CamYaw
@onready var pitch_node = $CamYaw/CamPitch
@onready var camera = $CamYaw/CamPitch/SpringArm3D/Camera3D

var yaw: float = 0
var pitch: float = 0

var yaw_sensitivity: float = 0.07
var pitch_sensitivity: float = 0.07

var yaw_acceleration: float = 15
var pitch_acceleration: float = 15

var pitch_max: float = 75
var pitch_min: float = -55

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * yaw_sensitivity
		pitch -= event.relative.y * pitch_sensitivity
		
func _physics_process(delta: float) -> void:
	pitch = clamp(pitch, pitch_min, pitch_max)
	
	yaw_node.rotation_degrees.y = lerp(yaw_node.rotation_degrees.y, yaw, yaw_acceleration * delta)
	pitch_node.rotation_degrees.x = lerp(pitch_node.rotation_degrees.x, pitch, pitch_acceleration * delta)
	set_cam_rotation.emit(yaw_node.rotation.y)
