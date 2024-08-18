extends Node3D

var UNLOCKED: bool = false
var DOORLOCKED: DoorLocked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	DOORLOCKED = $"walls/Door-locked"


func open_door():
	if !UNLOCKED:
		DOORLOCKED.onlock_door()
		UNLOCKED = false


func _on_unlock_door_area_body_entered(body: Node3D) -> void:
	print("Area entered")
	open_door()
