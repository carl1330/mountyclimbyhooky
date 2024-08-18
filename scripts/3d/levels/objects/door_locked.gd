extends StaticBody3D

class_name DoorLocked

var UNLOCKED: bool = false
var DOOR: Door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = get_children()
	
	DOOR = $wall_doorway/Door
	

func onlock_door():
	DOOR.open_door()
	UNLOCKED = true
