extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
const SPEED : int = 200
func _ready():
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x += SPEED * delta
	elif Input.is_action_pressed("ui_left"):
		position.x += -1*SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	elif Input.is_action_pressed("ui_up"):
		position.y += -1*SPEED * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
