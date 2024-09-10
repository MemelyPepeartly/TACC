extends Control

var core_system
var maps = []

func init(core):
	core_system = core
	load_maps("res://TACC/Components/TravelManager/TravelManagerConfig.json")
	print("TravelManager initialized.")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_maps(config_path: String):
	var file = FileAccess.open(config_path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()

		var json = JSON.new()
		var json_result = json.parse(json_text)
		
		if json_result.error != OK:
			print("Failed to parse JSON: ", json_result.error_string)
			return

		maps = json_result.result["maps"]
		
func load_waypoints(mapId: String):
	maps.find(mapId)
	

	
