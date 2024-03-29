extends RigidBody2D

var durability = 1
var points = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(rand_range(50, 1000))
	position = Vector2(rand_range(50, 1000), -50)
	apply_impulse(position, Vector2(0, 600)) # make rock full speed as soon as it is created
	set_angular_velocity(rand_range(-5, 5))


func _physics_process(delta):
	if ProjectSettings.get("gameIsRunning") == false:
		get_node(".").queue_free()

	if durability <= 0:
		ProjectSettings.set("gameScore", ProjectSettings.get("gameScore") + points)
		ProjectSettings.set("triggerExplosionSound", true)
		get_node(".").queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	#print(get_node("."))
	get_node(".").queue_free()
	
func _on_RigidBody2D_Rock_body_entered(body):
	if body != null:
		if "Ship" in body.name:
			ProjectSettings.set("gameLevel", false)