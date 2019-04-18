extends ColorRect
var ligado = 0
func _ready():
	pass
func _process(delta):
	if ligado == 1:
		self.show()
	else:
		self.hide()	
		
	if Input.is_action_just_pressed("inven") and ligado == 0:
		ligado = 1
	elif Input.is_action_just_pressed("inven") and ligado == 1:
		ligado = 0

	