extends Area2D
var mouse_area = false
var click = false
var movimento = false
var pos_atual
func _ready():

	pass
	
func _process(delta):
	if Input.is_action_just_pressed('mouse') and mouse_area == true:
		click = true
		print('true')
	if Input.is_action_just_released('mouse') :
		print('false')
		click = false
		position = pos_atual
	pass
	
func _input(event):
	
	if click == true:
		if event is InputEventMouseMotion:
			position = event.position
	pass
			
func _on_obj_mouse_entered():
	print('entrou')
	mouse_area = true
		
	pass 
func _on_obj_mouse_exited():
	mouse_area = false
	print('saiu')
	pass 


func _on_obj_area_entered(area):
	pos_atual = area.position
	pass 




