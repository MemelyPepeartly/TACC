extends Node2D

# Dictionary to hold references to loaded plugins
var plugins = {}

func _ready():
	# Loading a plugin
	load_plugin("res://TACC/Components/CutsceneManager/CutsceneManager.tscn")
	load_plugin("res://TACC/Components/TravelManager/TravelManager.tscn")
	print("CoreSystem is ready and plugins are loaded.")

# Function to load a plugin and add it to the Core node
func load_plugin(plugin_path: String):
	var plugin_scene = ResourceLoader.load(plugin_path)
	
	if plugin_scene == null:
		print("Failed to load plugin: ", plugin_path)
		return
	
	var plugin_instance = plugin_scene.instantiate()
	add_child(plugin_instance)
	plugin_instance.init(self)
	plugins[plugin_path] = plugin_instance

# Function to unload a plugin
func unload_plugin(plugin_path: String):
	if plugins.has(plugin_path):
		plugins[plugin_path].shutdown()
		plugins[plugin_path].queue_free()
		plugins.erase(plugin_path)

# Method to manage updates or other core logic
func _process(delta):
	pass
