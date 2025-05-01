extends Control

@onready var tile_grid: GridContainer = $HBoxContainer/TileGrid
@onready var sound: AudioStreamPlayer = $Sound
@onready var scorer: Scorer = $Scorer
@onready var moves_count_label: Label = $HBoxContainer/MarginContainer/VBoxContainer/HBMoves/MovesCountLabel
@onready var pairs_count_label: Label = $HBoxContainer/MarginContainer/VBoxContainer/HBPairs/PairsCountLabel

const MEMORY_TILE = preload("res://Scenes/MemoryTile/MemoryTile.tscn")

func _on_texture_button_pressed() -> void:
	for tile in tile_grid.get_children():
		tile.queue_free()
	SoundManager.play_button_click(sound)
	SignalHub.emit_game_exit_pressed()


func _enter_tree() -> void:
	SignalHub.level_selected.connect(on_level_selected)

func _process(delta: float) -> void:
	moves_count_label.text = scorer.get_moves_made_str()
	pairs_count_label.text = scorer.get_pairs_made_str()

func on_level_selected(level: int) -> void:
	var level_data_selector: LevelDataSelector = LevelDataSelector.get_level_selection(level)
	
	var frame_image: Texture2D = ImageManager.get_random_frame_image()
	
	tile_grid.columns = level_data_selector.get_num_columns()
	
	for image in level_data_selector.get_selected_images():
		add_memory_tile(image, frame_image)
	
	scorer.clear_new_game(level_data_selector.get_target_pairs())
	

func add_memory_tile(image: Texture2D, frame: Texture2D) -> void:
	var new_memory_tile: MemoryTile = MEMORY_TILE.instantiate()
	tile_grid.add_child(new_memory_tile)
	new_memory_tile.setup(image, frame)
