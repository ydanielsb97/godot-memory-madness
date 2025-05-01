extends Node

signal level_selected(level: int)
signal game_exit_pressed
signal tile_selected(memory_tile: MemoryTile)
signal game_over(moves_taken: int)

func emit_level_selected(level: int) -> void:
	level_selected.emit(level)

func emit_game_exit_pressed() -> void:
	game_exit_pressed.emit()

func emit_tile_selected(memory_tile: MemoryTile) -> void:
	tile_selected.emit(memory_tile)
	
func emit_game_over(moves_taken: int) -> void:
	game_over.emit(moves_taken)
