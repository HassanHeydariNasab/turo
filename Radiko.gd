extends Node2D

onready var PreParto = get_node("PreParto")
onready var Kamero = get_node("Kamero")
onready var V_rulumilo = get_node("Kanvaso/V_rulumilo")
onready var vido_Materialo = get_node("Kanvaso/vido_Materialo")
onready var Partoj = get_node("Partoj")
onready var Materialoj = get_node("Materialoj")
onready var C3_spiccato = get_node("C3_spiccato")
onready var C5_spiccato = get_node("C5_spiccato")
onready var E3_spiccato = get_node("E3_spiccato")
onready var E5_spiccato = get_node("E5_spiccato")
onready var G3_spiccato = get_node("G3_spiccato")
onready var G5_spiccato = get_node("G5_spiccato")
onready var C3_pizzicato = get_node("C3_pizzicato")
onready var C5_pizzicato = get_node("C5_pizzicato")
onready var Kreski_sono  = get_node("Kreski_sono")
onready var Materialo1_sono  = get_node("Materialo1_sono")
onready var Materialo2_sono  = get_node("Materialo2_sono")
onready var Materialo3_sono  = get_node("Materialo3_sono")
onready var Materialo4_sono  = get_node("Materialo4_sono")
onready var Materialo5_sono  = get_node("Materialo5_sono")
#onready var FPS = get_node("Kanvaso/FPS")
onready var Parto = preload("res://Parto.tscn")
onready var Materialo = preload("res://Materialo.tscn")

var alto = 0

var oktavo = 3

func _ready():
	T.Radiko = self
	T.materialo = 100
	for i in range(-11000, 0, 250):
		randomize()
		var Materialo_ = Materialo.instance()
		var materialo = int(rand_range(50,200))
		Materialo_.materialo = materialo/2.5
		Materialo_.set_scale(Vector2(materialo/50, materialo/50))
		Materialo_.set_global_pos(
			Vector2(rand_range(300-materialo,300+materialo),
			i-pow(1.3,abs(i/200))
		))
		Materialoj.add_child(Materialo_)
	set_process_input(true)
	set_fixed_process(true)
#	set_process(true)

func _input(evento):
	if evento.type == InputEvent.MOUSE_BUTTON:
		if evento.button_index == BUTTON_LEFT:
			if evento.pos.y > 100 and evento.pos.x < 570:
				if evento.is_pressed() and T.materialo > 0:
					PreParto.set_scale(Vector2(1,1))
					PreParto.set_global_pos(get_global_mouse_pos())
					PreParto.show()
					Kreski_sono.stop()
					Kreski_sono.play()
				elif PreParto.is_visible():
					PreParto.hide()
					Kreski_sono.stop()
					if oktavo == 3:
						if alto < 1000:
							C3_spiccato.play()
						elif alto >= 4000:
							G3_spiccato.play()
						elif alto >= 1000:
							E3_spiccato.play()
						oktavo = 5
					elif oktavo == 5:
						if alto < 1000:
							C5_spiccato.play()
						elif alto >= 4000:
							G5_spiccato.play()
						elif alto >= 1000:
							E5_spiccato.play()
						oktavo = 3
					var Parto_ = Parto.instance()
					Parto_.set_global_pos(PreParto.get_global_pos())
					var Formo_ = RectangleShape2D.new()
					Formo_.set_extents(Vector2(10,10)*PreParto.get_scale())
					Parto_.add_shape(Formo_)
					Parto_.set_mass(PreParto.get_scale().x/100)
					Parto_.set_sleeping(false)
					Partoj.add_child(Parto_)
					Parto_.Aspekto.set_scale(PreParto.get_scale())
		
		elif evento.button_index == BUTTON_WHEEL_UP:
			V_rulumilo.set_value(V_rulumilo.get_value()-100)
		elif evento.button_index == BUTTON_WHEEL_DOWN:
			V_rulumilo.set_value(V_rulumilo.get_value()+100)
	elif evento.type == InputEvent.MOUSE_MOTION:
		if evento.pos.y > 100 and evento.pos.x < 570:
			PreParto.set_global_pos(get_global_mouse_pos())

func _fixed_process(delta):
	if PreParto.is_visible() and T.materialo > 0:
		var faktoro = PreParto.get_scale().x
		faktoro += 1/faktoro
#		PreParto.set_scale(PreParto.get_scale()+Vector2(0.1,0.1))
		PreParto.set_scale(Vector2(faktoro,faktoro))
		T.materialo -= 1
	elif T.materialo <= 0:
		Kreski_sono.stop()

#func _process(delta):
#	FPS.set_text(str(int(1.0/delta)))

func _on_H_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(valoro,Kamero.get_offset().y))

func _on_V_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(Kamero.get_offset().x,valoro))

func _on_Rekomencu_pressed():
	get_tree().reload_current_scene()

func _on_T200_timeout():
	for Parto_ in Partoj.get_children():
		if Parto_.get_layer_mask_bit(0):
			Parto_.get_linear_velocity().x