extends KinematicBody2D
var pos_ini 
var pos_fin
export var direita = false
var vida = 5
export var distancia = 60
var speed = 0.5
func _ready():
	pos_ini = position.x
	pos_fin = pos_ini - distancia
	pass
	
func _process(delta):
	
	if pos_ini >= pos_fin and direita == false:
		position.x -= speed
		$Sprite.flip_h = false
		if position.x <= pos_fin:
			direita = true
	else:
		position.x += speed
		$Sprite.flip_h = true
		if position.x >= pos_ini:
			direita = false
	
	
func dano():
	vida -= 1
	print(vida)
	if vida <= 0:
		queue_free()

