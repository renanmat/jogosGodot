extends Node
var ligado = 0


func _ready():
	$gameover.hide()
	get_tree().paused = false
	pass

func _process(delta):
	
	if ligado == 1:
		get_tree().paused = true
	else:
		get_tree().paused = false
		
	if Input.is_action_just_pressed("inven") and ligado == 0:
		ligado = 1
	elif Input.is_action_just_pressed("inven") and ligado == 1:
		ligado = 0
	pass



func _on_player2_perdeu():
	get_tree().paused = true
	$gameover.show()
	$gameover/CenterContainer/VBoxContainer/fimjogo.text = 'Vitoria'
	pass # Replace with function body.


func _on_player1_derrota():
	get_tree().paused = true
	$gameover.show()
	$gameover/CenterContainer/VBoxContainer/fimjogo.text = 'derrota'
	pass # Replace with function body.
