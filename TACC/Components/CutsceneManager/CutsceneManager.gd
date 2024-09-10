extends Control

var core_system

var cutscenes = []
var current_cutscene_index = 0

func init(core):
	core_system = core
	load_cutscenes("res://TACC/Components/CutsceneManager/CutsceneConfig.json")
	print("CutsceneManager initialized.")

func load_cutscenes(config_path: String):
	var file = FileAccess.open(config_path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()

		var json = JSON.new()
		var json_result = json.parse(json_text)
		
		if json_result.error != OK:
			print("Failed to parse JSON: ", json_result.error_string)
			return

		cutscenes = json_result.result["cutscenes"]

func play_next_cutscene():
	if (current_cutscene_index < cutscenes.size()):
		var cutscene = cutscenes[current_cutscene_index]
		play_cutscene(cutscene)
		current_cutscene_index += 1
	else:
		print("All cutscenes finished.")
		core_system.unload_plugin(self.get_path())

func play_cutscene(cutscene):
	print("Playing cutscene:", cutscene["name"])
	call_deferred("play_next_cutscene")
	
func print_cutscenes():
	pass

func shutdown():
	print("CutsceneManager shutting down.")
