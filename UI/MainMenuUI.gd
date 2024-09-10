extends Control

# Reference to the CoreSystem, which handles loading plugins
var core_system: Node2D = null
var speed: int = 500

func _ready():
	# Find the CoreSystem in the scene tree, assuming it's already loaded
	core_system = get_tree().root.get_node("Core")
	if core_system == null:
		print("CoreSystem not found!")		

# Called when the button is pressed
func _on_play_cutscene_button_pressed():
	if core_system:
		# Load the CutsceneManager plugin and play the first cutscene
		core_system.load_plugin("res://TACC/Components/CutsceneManager/CutsceneManager.tscn")
		var cutscene_manager = core_system.plugins["res://TACC/Components/CutsceneManager/CutsceneManager.tscn"]
		cutscene_manager.play_next_cutscene()
	else:
		print("CoreSystem is not initialized or not found.")

func _on_start_travel_manager_button_pressed() -> void:
	if core_system:
		# Load the TravelManager plugin
		core_system.load_plugin("res://TACC/Components/TravelManager/TravelManager.tscn")
		var cutscene_manager = core_system.plugins["res://TACC/Components/TravelManager/TravelManager.tscn"]
		# Do something with it
	else:
		print("CoreSystem is not initialized or not found.")
		
func _process(delta: float) -> void:
	# Token movement
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	get_node("CharacterSprite").position += direction * speed * delta
