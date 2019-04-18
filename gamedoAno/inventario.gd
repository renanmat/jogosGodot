extends Node2D
var ligado = false
func _ready():
	self.hide()
	pass

func _process(delta):
	if Input.is_action_just_pressed("inventario") and ligado == false:
		ligado = true
		self.show()
		get_tree().paused = true
	elif Input.is_action_just_pressed('inventario') and ligado == true:
		ligado = false
		self.hide()
		get_tree().paused = false
	pass