@tool
extends EditorScript

const PATH: String = "res://Assets/glitch/"
const RESOURCE_PATH: String = "res://Resources/image_files_list.tres"

func _run() -> void:
	var dir: DirAccess = DirAccess.open(PATH)
	var image_file_list: ImageFilesListResource = ImageFilesListResource.new()
	
	if dir:
		var files: PackedStringArray = dir.get_files()
		for file_name in files:
			image_file_list.add_file(PATH + file_name)
	
	ResourceSaver.save(image_file_list, RESOURCE_PATH)
