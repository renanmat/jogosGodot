extends KinematicBody2D
var direcao = Vector2 (0, 0)
var tamanho_da_tela
var na_area = false
var vida = 70
var die = false
signal perdeu

func _ready():
	tamanho_da_tela = get_viewport_rect().size
	$AnimatedSprite.flip_h = true
	$Label.text = '70/70'
	
func _process(delta):
	
	direcao.y += 400 * delta
	move_and_collide(direcao * delta)
	
	$AnimatedSprite.play()
	
	if move_and_collide(direcao * delta) and die == false:
		direcao = move_and_collide(direcao * delta).normal
		
		if get_parent().get_node('player1').position.x < position.x and na_area == false:
			$AnimatedSprite.flip_h = true
			direcao.x -= 50
			$AnimatedSprite.animation = 'direita'
			$area_atck/shape.position = Vector2(-40.377, -4.906)
		elif na_area == true:
			var animacao = get_parent().get_node('player1/AnimatedSprite').animation
			if animacao != 'ataque': 
				direcao.x = 0
				$AnimationPlayer.play('atck')
			
			elif animacao == 'ataque':
				direcao.x = 0
				$AnimatedSprite.animation = 'defesa'
				
				
		else:
			direcao.x += 50	
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.animation = 'direita'
			$area_atck/shape.position = Vector2(32.669, -4.906)
	
	else:
		$AnimatedSprite.animation = 'parado'
		
	
		
	position.x = clamp(position.x, 0, tamanho_da_tela.x)
	position.y = clamp(position.y, 0, tamanho_da_tela.y)
	
func interacao():
	na_area = true
func saiu_area():
	na_area = false

func area_atck(body):
	body.dano()
func dano():
	vida -= 15
	$Label.text = str(vida) + '/70'
	if vida <= 0:
		die = true
		$AnimationPlayer.play('die')
		print('ganhou')
func die():
	emit_signal('perdeu')
	
func ini_atck():
	$area_atck/shape.disabled = true
func fim_atck():
	$area_atck/shape.disabled = false