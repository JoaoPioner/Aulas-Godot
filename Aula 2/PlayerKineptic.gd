extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0
onready var target = position

func get_8way_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func get_rotation_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)

func get_mouse_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation)

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()


func _physics_process(delta):
	#Movimentacao Direcional
	#get_8way_input()
	
	#Movimentacao Rotacional( tipo carro)
	#get_rotation_input()
	#rotation += rotation_dir * rotation_speed * delta
	
	#Movimentacao de mouse(rotaciona com o mouse)
	#get_mouse_input()
	
	#Deslocamento
	#velocity = move_and_slide(velocity)
	
	#Movimentacao mouse 2 (vai onde vc clica)
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	
	
