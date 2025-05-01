extends TextureButton

@export var level_number: int = 1
@onready var label: Label = $Label

func _ready() -> void:
	var level_settings: LevelSettingResource = LevelDataSelector.get_level_setting(level_number)
	
	if level_settings == null:
		queue_free()
	else:
		label.text = "%dx%d" % [level_settings.columns, level_settings.rows]


func _on_pressed() -> void:
	SignalHub.emit_level_selected(level_number)
