extends Resource

class_name LevelSettingResource

@export var level_number: int
@export var rows: int
@export var columns: int

func get_rows() -> int:
	return rows

func get_columns() -> int:
	return columns

func get_level_number() -> int:
	return level_number

func get_target_pairs() -> int:
	return (rows * columns) / 2
