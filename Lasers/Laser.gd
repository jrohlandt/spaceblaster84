extends Area2D

# Declare member variables here. Examples:
const SPEED: int = 1820
const UP: int = -1
const DOWN: int  = 1
var direction: int = UP
var velocity: Vector2 = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#position = Vector2(540, 1800)


func _physics_process(delta):
	velocity.y = SPEED * delta * direction
	translate(velocity) 


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func setPosition(pos: Vector2) -> void:
	position = pos


func _on_Laser_body_entered(body):
	if body != null:
		if "Ship" in body.name: return
	if body != null && "Rock" in body.name:
		body.durability -= 1
		queue_free()
