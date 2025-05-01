extends Control

@onready var music: AudioStreamPlayer = $Music
@onready var main: Control = $Main
@onready var game_ui: Control = $GameUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_game_exit_pressed()

func _enter_tree() -> void:
	SignalHub.game_exit_pressed.connect(on_game_exit_pressed)
	SignalHub.level_selected.connect(on_level_selected)

func on_game_exit_pressed() -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	show_game(false)

func on_level_selected(level: int) -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)
	show_game(true)
	
func show_game(show: bool) -> void:
	game_ui.visible = show
	main.visible = !show
