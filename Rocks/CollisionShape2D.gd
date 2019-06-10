extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				var Player = get_slide_collision(i).collider
				Player.dead()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
