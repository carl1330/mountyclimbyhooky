extends Node3D

var CHEST: Chest
var CHESTUNLOCKED: bool = false

func _ready() -> void:
	CHEST = $House/Structure/ChestRoom/Chest
	
func open_chest():
	if !CHESTUNLOCKED:
		CHEST.open_chest()
		CHESTUNLOCKED = true

func _on_open_chest_area_body_entered(body: Node3D) -> void:
	if !CHESTUNLOCKED:
		open_chest()
