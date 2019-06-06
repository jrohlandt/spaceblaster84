extends ParallaxBackground

# Declare member variables here. Examples:
var offsetLocation = 0
var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Process - Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offsetLocation = offsetLocation + speed * delta
	set_scroll_offset(Vector2(0, offsetLocation))
	
