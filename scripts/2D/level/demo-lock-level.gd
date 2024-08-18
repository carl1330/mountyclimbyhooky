# DEMO LOCK LEVEL
# This scene introduces the user to the basic game mechanics seen
# in the lock levels. The code in this script is intended to be
# repurposed in other levels.

extends Node2D

var PINCOUNT = 4
var PINS: Array
var PUSHED = 0

func handle_lockpin_event(lockPin):
	PUSHED += 1
	if PUSHED == PINCOUNT:
		print("Level succeeded")
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = self.get_children()
	
	for child in children:
		if child is LockPin:
			PINS.append(child)
			child.connect("was_pushed", handle_lockpin_event)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
