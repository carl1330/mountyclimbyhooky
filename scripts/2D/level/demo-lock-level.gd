# DEMO LOCK LEVEL
# This scene introduces the user to the basic game mechanics seen
# in the lock levels. The code in this script is intended to be
# repurposed in other levels.

extends Node2D

var PINCOUNT = 4
var PINS: Array = []
var PUSHED = 0

func handle_lockpin_event():
	PUSHED += 1
	if PUSHED == PINCOUNT:
		$UI/LevelSuccessPlayer.play("level-success-popup")
			
		
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var children = self.get_children()
	var platform1 = $"Environment/Pins"
	for child in platform1.get_children():
		if child is LockPin:
			PINS.append(child)
			child.connect("was_pushed", handle_lockpin_event)

# Fade out
func _on_level_success_player_animation_finished(anim_name: StringName) -> void:
	$FadeOut/FadeOutPlayer.play("fade-out")
