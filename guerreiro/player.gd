extends KinematicBody2D
var animacao = ''
var direcao = Vector2 ()
var tamanho_da_tela
const SPEED = 180
const GRAVIDADE = 20
const PULO = - 600
const UP = Vector2(0, -1)
var vida = 50
var die = false
signal derrota

func _ready():
	
	tamanho_da_tela = get_viewport_rect().size
	$Label.text = '50/50'
func _physics_process(delta):
	
	direcao.y += GRAVIDADE
	
	$AnimatedSprite.play(animacao)
	if die == false: 
		if Input.is_action_pressed('direita'):
			$AnimatedSprite.flip_h = false
			direcao.x = SPEED
			animacao = 'direita'
		elif Input.is_action_pressed('esquerda'):
			$AnimatedSprite.flip_h = true
			direcao.x = -SPEED
			animacao = 'direita'	
		elif Input.is_action_pressed('ataque'):
			animacao = 'ataque'	
			$area_atck/shape.disabled = false
			
				
	
		else:
			direcao.x = 0
			animacao = 'parado'
			$area_atck/shape.disabled = true	
			
		if is_on_floor():
			if Input.is_action_pressed('pulo'):
				direcao.y = PULO
			
		
	move_and_slide(direcao, UP)
		
		
		
		
	position.x = clamp(position.x, 0, tamanho_da_tela.x)
	position.y = clamp(position.y, 0, tamanho_da_tela.y)


func dano():
	
	vida -= 10
	$Label.text = str(vida) + '/50'
	if vida <= 0:
		die = true
		$AnimatedSprite.play('parado')
		$AnimationPlayer.play('die')
		print('perdeu')
	

func _on_Area2D_body_entered(body):
	body.interacao()

func _on_Area2D_body_exited(body):
	body.saiu_area()


func _on_area_atck_body_entered(body):

	body.dano()
	pass
func die():
	emit_signal("derrota")