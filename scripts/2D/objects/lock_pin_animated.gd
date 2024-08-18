# LockPin class
# Responsible for keeping track of its own state: IS_PUSHED, which can
# either be true or false. The inital state of IS_PUSHED is false. Once
# the LockPin has been pushed, it emits the signal was_pushed. A LockPin
# may only be pushed once.

extends StaticBody2D

class_name LockPin

signal was_pushed(LockPin)

var IS_PUSHED: bool = false

func go_up():
	if IS_PUSHED != true:
		var slide_tween = get_tree().create_tween()
		slide_tween.tween_property(self, "position", position + Vector2(0, -15), .4)
		IS_PUSHED = true
		
		was_pushed.emit()
