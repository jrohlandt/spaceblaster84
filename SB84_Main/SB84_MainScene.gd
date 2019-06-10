extends Node

# Member variables
var gameIsRunning :bool = false
var score: int = 0
var highScore: int = 0
var triggerExplosionSound = false


# Called when the node enters the scene tree for the first time.
func _ready():
	ProjectSettings.set("gameIsRunning", false)
	ProjectSettings.set("gameScore", score)
	ProjectSettings.set("gameLevel", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
		
	if ProjectSettings.get("gameIsRunning") == true:
		run_game(delta)
	else:
		if Input.is_action_pressed("ui_accept"):
			start_game()


func start_game():
	score = 0
	$HUD_Root.setScore(score)
	$Label_info.set_text("Running")
	$HUD_Root.setRunning()
	$Music_Root.set_music("level_01")
	ProjectSettings.set("gameIsRunning", true)
	ProjectSettings.set("gameScore", score)
	ProjectSettings.set("gameLevel", true)
	
func run_game(delta):
	if ProjectSettings.get("gameScore") > score:
		score = ProjectSettings.get("gameScore")
		$HUD_Root.setScore(score)
		
	if Input.is_action_pressed("ui_cancel") or ProjectSettings.get("gameLevel") == false:
		ProjectSettings.set("gameIsRunning", false)
		$Label_info.set_text("Game Over")
		if score > highScore:
			highScore = score
		$HUD_Root.setGameOver(highScore)
		$Music_Root.set_music("menu")
	
	if ProjectSettings.get("triggerExplosionSound") == true:
		$Explosion.play()
		ProjectSettings.set("triggerExplosionSound", false)
#	if Input.is_action_just_pressed("ui_select"):
#		score += 1
#		$HUD_Root.setScore(score)
