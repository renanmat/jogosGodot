extends Control

func _ready():
	pass




func _on_menu_pressed():
	get_tree().change_scene("res://menu.tscn")


func _on_jogar_pressed():
	get_tree().change_scene("res://main.tscn")
