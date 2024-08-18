extends StaticBody3D

class_name Chest

var OPENANIMATION: AnimationPlayer
var UNLOCKED: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OPENANIMATION = $chest_gold/ChestLid/OpenChestPlayer

func open_chest():
	if (!UNLOCKED):
		OPENANIMATION.play("open-chest")
		UNLOCKED = true
