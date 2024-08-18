extends Node3D

var UNLOCKED: bool = false
var DOORLOCKED: DoorLocked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DOORLOCKED = $"walls/Door-locked"


func open_door():
	if !UNLOCKED:
		DOORLOCKED.onlock_door()
		UNLOCKED = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if !UNLOCKED:
		open_door()
