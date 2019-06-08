extends KinematicBody2D

var gameIsRunning: bool = false
var maxSpeed = 700
var acceleration = 80
var kinematicSpeed = Vector2(0, 0)
var shipPaddingX = 58
var shipPaddingY = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node(".").move(Vector2(540, 1450))
	pass
	
func _physics_process(delta):
	
	if gameIsRunning == false:
		position.x = get_viewport().get_visible_rect().size.x / 2
		position.y = get_viewport().get_visible_rect().size.y - 480
		
		if Input.is_action_pressed("ui_accept"):
			gameIsRunning = true
		
	if movementKeyIsBeingPressed():
		if Input.is_action_pressed("ui_up"):
			if kinematicSpeed.y > -maxSpeed:
				kinematicSpeed = kinematicSpeed + Vector2(0, -acceleration)
				print("up")
		if Input.is_action_pressed("ui_down"):
			if kinematicSpeed.y < maxSpeed:
				kinematicSpeed = kinematicSpeed + Vector2(0, acceleration)
		if Input.is_action_pressed("ui_left"):
			if kinematicSpeed.x > -maxSpeed:
				kinematicSpeed = kinematicSpeed + Vector2(-acceleration, 0)
				
		if Input.is_action_pressed("ui_right"):
			if kinematicSpeed.x < maxSpeed:
				kinematicSpeed = kinematicSpeed + Vector2(acceleration, 0)
	else:
		kinematicSpeed.x = lerp(kinematicSpeed.x, 0, .12)
		kinematicSpeed.y = lerp(kinematicSpeed.y, 0, .12)
		
	move_and_slide(kinematicSpeed)

	# check top limit
	if position.y < shipPaddingY:
		kinematicSpeed.y = 0
		position.y = shipPaddingY
		
	# check bottom limit
	if position.y > get_viewport().get_visible_rect().size.y - shipPaddingY:
		print(get_viewport().get_visible_rect().size.y)
		kinematicSpeed.y = 0
		position.y = get_viewport().get_visible_rect().size.y - shipPaddingY
	
	# check left limit
	if position.x < shipPaddingX:
		kinematicSpeed.x = 0
		position.x = shipPaddingX
	
	# check right limit
	if position.x > OS.get_window_size().x - shipPaddingX:
		kinematicSpeed.x = 0
		position.x = OS.get_window_size().x - shipPaddingX
		
	if Input.is_action_pressed("ui_cancel"):
		kinematicSpeed = Vector2(0, 0)
		gameIsRunning = false
		
		
func movementKeyIsBeingPressed() -> bool:
	
	if Input.is_action_pressed("ui_up"):
		return true
	
	if Input.is_action_pressed("ui_down"):
		return true
		
	if Input.is_action_pressed("ui_left"):
		return true
		
	if Input.is_action_pressed("ui_right"):
		return true
		
	return false
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
