extends KinematicBody2D
var movimento = Vector2()
var speed = 10
var animacao
var vida = 5
func _ready():
	pass
	
func _physics_process(delta):
	
	if Input.is_action_pressed('ui_up'):
		movimento.y -= speed
	elif Input.is_action_pressed('ui_down'):
		movimento.y += speed
	elif Input.is_action_pressed('ui_right'):
		movimento.x += speed
		animacao = 'ataque'
		
	elif Input.is_action_pressed('ui_left'):
		movimento.x -= speed
		animacao = 'ataque_esq'
		
	else:
		movimento = Vector2(0, 0)	
		
	move_and_slide(movimento)	
	
func dano_ini():
	vida -= 1 
	if vida <= 0:
		queue_free()
	print(vida)