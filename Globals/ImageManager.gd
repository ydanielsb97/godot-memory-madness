extends Node

const RESOURCE_PATH: String = "res://Resources/image_files_list.tres"
const FRAME_IMAGES: Array[Texture2D] = [
	preload("res://Assets/frames/blue_frame.png"),
	preload("res://Assets/frames/green_frame.png"),
	preload("res://Assets/frames/red_frame.png"),
	preload("res://Assets/frames/yellow_frame.png")
]

var _image_list: Array[Texture2D]

func _enter_tree() -> void:
	var image_file_list: ImageFilesListResource = load(RESOURCE_PATH)
	for file in image_file_list.file_names:
		_image_list.append(load(file))

func shuffle_images() -> void:
	_image_list.shuffle()

func get_image(index: int) -> Texture2D:
	return _image_list[index]

func get_random_item_image() -> Texture2D:
	return _image_list.pick_random()

func get_random_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random()
