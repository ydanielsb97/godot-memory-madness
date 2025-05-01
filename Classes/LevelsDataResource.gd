extends Resource

class_name LevelsDataResource

@export var levels: Array[LevelSettingResource]

func get_level_count() -> int:
	return levels.size()

func get_level_data(level: int) -> LevelSettingResource:
	for level_data in levels:
		if level_data.get_level_number() == level:
			return level_data
	return null
