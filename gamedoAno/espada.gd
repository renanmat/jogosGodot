extends Area2D
var animacao = 'ataque'
func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		animacao = 'ataque'
	elif Input.is_action_pressed("ui_left"):
		animacao = 'ataque_esq'
	if Input.is_action_pressed("ataque"):
		$AnimationPlayer.play(animacao)
	else:
		$AnimationPlayer.play('idle')

func _on_espada_body_entered(body):
	body.dano()
	pass # Replace with function body.
