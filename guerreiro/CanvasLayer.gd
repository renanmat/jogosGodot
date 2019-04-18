extends CanvasLayer

func _ready():
	self.hide()
	pass
func _process(delta):
	
	if Input.is_action_just_pressed("inven"):
		self.show()
		
	

