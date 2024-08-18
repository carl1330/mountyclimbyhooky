extends StaticBody3D

class_name Door

var OPENANIMATION: AnimationPlayer
var UNLOCKED: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OPENANIMATION = $OpenDoorPlayer
	pass

func open_door():
	if (!UNLOCKED):
		OPENANIMATION.play("open")
		UNLOCKED = true
	
