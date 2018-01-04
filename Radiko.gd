extends Node2D

onready var PreParto = get_node("PreParto")
onready var Kamero = get_node("Kamero")
onready var vido_Materialo = get_node("Kanvaso/vido_Materialo")
onready var Parto = preload("res://Parto.tscn")

func _ready():
	T.Radiko = self
	T.materialo = 100
	set_process_input(true)
	set_fixed_process(true)

func _input(evento):
	if evento.type == InputEvent.MOUSE_BUTTON:
		if evento.pos.y > 100 and evento.pos.x < 570:
			if evento.is_pressed() and T.materialo > 0:
				PreParto.set_scale(Vector2(1,1))
				PreParto.set_global_pos(get_global_mouse_pos())
				PreParto.show()
			elif PreParto.is_visible():
				PreParto.hide()
				var Parto_ = Parto.instance()
				Parto_.set_global_pos(PreParto.get_global_pos())
				var Formo_ = RectangleShape2D.new()
				Formo_.set_extents(Vector2(10,10)*PreParto.get_scale())
				Parto_.add_shape(Formo_)
				Parto_.set_mass(PreParto.get_scale().x/100)
				Parto_.set_sleeping(false)
				add_child(Parto_)
				Parto_.Aspekto.set_scale(PreParto.get_scale())
	elif evento.type == InputEvent.MOUSE_MOTION:
		if evento.pos.y > 100 and evento.pos.x < 570:
			PreParto.set_global_pos(get_global_mouse_pos())

func _fixed_process(delta):
	if PreParto.is_visible() and T.materialo > 0:
		PreParto.set_scale(PreParto.get_scale()+Vector2(0.1,0.1))
		T.materialo -= 1

func _on_H_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(valoro,Kamero.get_offset().y))

func _on_V_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(Kamero.get_offset().x,valoro))

func _on_Rekomencu_pressed():
	get_tree().reload_current_scene()
