extends Node

var menu = load("res://Music/menu.ogg")
var level_01 = load("res://Music/level_01.ogg")
var soundOn: bool = true
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	#$AudioStreamPlayer.set_loop(true)
	$AudioStreamPlayer.set_stream(menu)
	$AudioStreamPlayer.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	
	if event.is_action("ui_sound") && event.is_pressed() && !event.is_echo():
		if $AudioStreamPlayer.is_playing():
			$AudioStreamPlayer.stop()
			soundOn = false
			return
			
		$AudioStreamPlayer.play()
		soundOn = true
		
		
func set_music(musicSelection):
	
	if $AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.stop()
		
	if musicSelection == 'menu':
		$AudioStreamPlayer.set_stream(menu)
	elif musicSelection == 'level_01':
		$AudioStreamPlayer.set_stream(level_01)
		
	if soundOn == true:
		$AudioStreamPlayer.play()
