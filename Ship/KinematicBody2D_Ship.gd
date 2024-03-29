extends KinematicBody2D

#var gameIsRunning: bool = false
var maxSpeed = 700
var acceleration = 80
var kinematicSpeed: Vector2 = Vector2(0, 0)
var shipPaddingX: int = 58
var shipPaddingY: int = 120

var LASER = preload("res://Lasers/Laser.tscn")
var laserCount: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	parkShip()
	
func _physics_process(delta):
	
	if ProjectSettings.get("gameIsRunning") == false:
		parkShip()
		
		
#		if Input.is_action_pressed("ui_accept"):
#			gameIsRunning = true
		
		return
		
	if movementKeyIsBeingPressed():
		if Input.is_action_pressed("ui_up"):
			if kinematicSpeed.y > -maxSpeed:
				kinematicSpeed = kinematicSpeed + Vector2(0, -acceleration)
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
		
#	kinematicSpeed = kinematicSpeed.normalized() * 
	kinematicSpeed = move_and_slide(kinematicSpeed)
#	var collision = move_and_collide(kinematicSpeed * delta)
#	print(collision)
#	if collision:
#		print(collision.collider.name)
#
##	print(get_slide_count())
#	if get_slide_count() > 0:
##		print('colliding')
#		for i in range(get_slide_count()):
#			print(get_slide_collision(i).collider.name)
#			if "Rock" in get_slide_collision(i).collider.name:
#				kinematicSpeed = Vector2(0, 0)
#				ProjectSettings.set("gameLevel", false)
			
	# check top limit
	if position.y < shipPaddingY:
		kinematicSpeed.y = 0
		position.y = shipPaddingY
		
	# check bottom limit
	if position.y > get_viewport().get_visible_rect().size.y - shipPaddingY:
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
		
	if Input.is_action_just_pressed("ui_select"):
		laserCount += 1
		var laser = LASER.instance()
		laser.set_name("Laser" + str(laserCount))
		get_parent().add_child(laser)
		laser.setPosition(position + Vector2(0, -92))
		$ShootSound.play()
#
#	if Input.is_action_pressed("ui_cancel"):
#		kinematicSpeed = Vector2(0, 0)
#		ProjectSettings.set("gameLevel", false)
		
		
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


func parkShip() -> void: 
	position.x = get_viewport().get_visible_rect().size.x / 2
	position.y = get_viewport().get_visible_rect().size.y - 480	

