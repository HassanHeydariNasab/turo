extends Node2D

onready var PreParto = get_node("PreParto")
onready var Kamero = get_node("Kamero")
onready var Fono = get_node("Fono")
onready var Tero = get_node("Tero")
onready var V_rulumilo = get_node("Kanvaso/V_rulumilo")
onready var vido_Materialo = get_node("Kanvaso/vido_Materialo")
onready var vido_Alto = get_node("Kanvaso/vido_Alto")
onready var vido_Rekordo = get_node("Kanvaso/vido_Rekordo")
onready var vido_Rekordo_Brili = get_node("Kanvaso/vido_Rekordo/Brili")
onready var Partoj = get_node("Partoj")
onready var Materialoj = get_node("Materialoj")
onready var Rektanguloj = get_node("Rektanguloj")
onready var Ebenoj = get_node("Ebenoj")
onready var T500 = get_node("T500")
onready var T30000 = get_node("T30000")
onready var Fonmuziko  = get_node("Fonmuziko")
onready var C3_spiccato = get_node("C3_spiccato")
onready var C5_spiccato = get_node("C5_spiccato")
onready var E3_spiccato = get_node("E3_spiccato")
onready var E5_spiccato = get_node("E5_spiccato")
onready var G3_spiccato = get_node("G3_spiccato")
onready var G5_spiccato = get_node("G5_spiccato")
onready var B3_spiccato = get_node("B3_spiccato")
onready var B5_spiccato = get_node("B5_spiccato")
onready var C3_pizzicato = get_node("C3_pizzicato")
onready var C5_pizzicato = get_node("C5_pizzicato")
onready var E3_tremolo = get_node("E3_tremolo")
onready var G3_tremolo = get_node("G3_tremolo")
onready var E3_timpani = get_node("E3_timpani")
onready var C3_chimes = get_node("C3_chimes")
onready var C4_chimes = get_node("C4_chimes")
onready var Crash_14 = get_node("Crash_14")
onready var Kreski_sono  = get_node("Kreski_sono")
onready var Ebeno_sono  = get_node("Ebeno_sono")
onready var Materialo1_sono  = get_node("Materialo1_sono")
onready var Materialo2_sono  = get_node("Materialo2_sono")
onready var Materialo3_sono  = get_node("Materialo3_sono")
onready var Materialo4_sono  = get_node("Materialo4_sono")
onready var Materialo5_sono  = get_node("Materialo5_sono")
#onready var FPS = get_node("Kanvaso/FPS")
onready var Parto = preload("res://Parto.tscn")
onready var Materialo = preload("res://Materialo.tscn")
onready var Rektangulo = preload("res://Rektangulo.tscn")
onready var Ebeno = preload("res://Ebeno.tscn")

var Celo_ = null

var alto = 0 setget set_alto
func set_alto(valoro):
	if valoro*0.1186 >= alto:
		alto = round(valoro*0.1186)
		V_rulumilo.set_value(-valoro-100)
		vido_Alto.set_text(str(alto)+"m")
		if alto > T.Agordejo.get_value("Rekordo", "rekordo",0):
			Fonmuziko.set_volume_db(5)
			T.Agordejo.set_value("Rekordo", "rekordo", alto)
			T.Agordejo.save(T.agordejo)
			vido_Rekordo.set_text(
				str(T.Agordejo.get_value("Rekordo", "rekordo",0))+"m"
			)
			vido_Rekordo_Brili.seek(0)
			vido_Rekordo_Brili.resume_all()
		else:
			Fonmuziko.set_volume_db(0)

var materialo setget set_materialo
func set_materialo(valoro):
	materialo = int(valoro)
	vido_Materialo.set_value(materialo)

var oktavo = 3

var koloro = "000000"

var rektangulo = false

var enajxoj = []

var konsumita_materialo = 0

func _ready():
	T.Radiko = self
	self.materialo = 100
	self.alto = 0
	vido_Rekordo.set_text(
		str(T.Agordejo.get_value("Rekordo", "rekordo","0"))+"m"
	)
	Fono.set_color(
		T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")]
	)
	koloro = T.koloroj[T.Agordejo.get_value("Koloro", "koloro", "Nigra")]
	var Senfinfino = get_node("Senfinfino")
	Senfinfino.set_global_pos(Vector2(0,-101300))
	if T.Radiko.koloro == "ffffff":
		get_node("Tero/Aspekto").set_color("ffffff")
		PreParto.get_node("Aspekto").set_color("ffffff")
		Senfinfino.set("custom_colors/font_color", "ffffff")
	V_rulumilo.set_min(-101000)
	for i in range(-101000, -500, 700):
		randomize()
		var Rektangulo_ = Rektangulo.instance()
		Rektangulo_.set_global_pos(
			Vector2(rand_range(100,500),
			i
		))
		Rektanguloj.add_child(Rektangulo_)
	for i in range(-101000, 0, 250):
		randomize()
		var Materialo_ = Materialo.instance()
		var materialo_ = int(rand_range(50,200))
		Materialo_.materialo = materialo_/2.5
		Materialo_.set_scale(Vector2(materialo_/50, materialo_/50))
		Materialo_.set_global_pos(
			Vector2(rand_range(300-materialo_,300+materialo_),
			i
		))
		Materialoj.add_child(Materialo_)
	for i in range(-101000, -4000, 12000):
		randomize()
		var Ebeno_ = Ebeno.instance()
		Ebeno_.set_global_pos(
			Vector2(300, i+rand_range(-2000,4000))
		)
		Ebenoj.add_child(Ebeno_)
	Fonmuziko.set("stream/play", T.Agordejo.get_value("Agordoj", "Muzikoj", true))
	vido_Rekordo_Brili.interpolate_property(vido_Rekordo,
		"custom_colors/font_color", Color("ffffff"), Color("D500F9"), 0.25,
		Tween.TRANS_SINE, Tween.EASE_OUT
	)
	vido_Rekordo_Brili.interpolate_property(vido_Rekordo,
		"custom_colors/font_color", Color("D500F9"), Color("ffffff"), 0.25,
		Tween.TRANS_SINE, Tween.EASE_OUT, 0.25
	)
	set_process_input(true)
	set_fixed_process(true)
#	set_process(true)

func _input(evento):
	if evento.type == InputEvent.MOUSE_BUTTON:
		if evento.button_index == BUTTON_LEFT:
			if evento.pos.y > 70 and evento.pos.x < 570:
				if evento.is_pressed() and materialo > 0:
					konsumita_materialo = 0
					PreParto.set_scale(Vector2(1,1))
					PreParto.set_global_pos(get_global_mouse_pos())
					PreParto.show()
					Kreski_sono.stop()
					Kreski_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
				elif PreParto.is_visible():
					if enajxoj.size() == 0:
						PreParto.hide()
						Kreski_sono.stop()
						if rektangulo:
							rektangulo = false
						if oktavo == 3:
							if alto < 2000:
								C3_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto > 8000:
								B3_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto > 4000:
								G3_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto >= 2000:
								E3_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							oktavo = 5
						elif oktavo == 5:
							if alto < 2000:
								C5_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto > 8000:
								B5_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto > 4000:
								G5_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
							elif alto >= 2000:
								E5_spiccato.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
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
					else:
						PreParto.hide()
						Kreski_sono.stop()
						self.materialo += konsumita_materialo/2
		
		elif evento.button_index == BUTTON_WHEEL_UP:
			V_rulumilo.set_value(V_rulumilo.get_value()-100)
		elif evento.button_index == BUTTON_WHEEL_DOWN:
			V_rulumilo.set_value(V_rulumilo.get_value()+100)
	elif evento.type == InputEvent.MOUSE_MOTION:
		if evento.pos.y > 70 and evento.pos.x < 570:
			PreParto.set_global_pos(get_global_mouse_pos())

func _fixed_process(delta):
	if PreParto.is_visible() and self.materialo > 0:
		var faktoro = PreParto.get_scale().x
		faktoro += 1/faktoro
#		PreParto.set_scale(PreParto.get_scale()+Vector2(0.1,0.1))
		if rektangulo:
			PreParto.set_scale(Vector2(faktoro,faktoro*1.618))
		else:
			PreParto.set_scale(Vector2(faktoro,faktoro))
		self.materialo -= 1
		konsumita_materialo += 1
	elif self.materialo <= 0:
		Kreski_sono.stop()

#func _process(delta):
#	FPS.set_text(str(int(1.0/delta)))

func _on_H_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(valoro,Kamero.get_offset().y))
	Fono.set_global_pos(Kamero.get_offset()+Vector2(-300,-500))

func _on_V_rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(Kamero.get_offset().x,valoro))
	Fono.set_global_pos(Kamero.get_offset()+Vector2(-300,-500))

func _on_Rekomencu_pressed():
	get_tree().reload_current_scene()

var sumo_rapido_x = 0
var sumo_rapido_y = 0
var rapido = 0
var averagxa_rapido_x = 0
var averagxa_rapido_y = 0
var partoj = 1
var diferenco = 0
func _on_T500_timeout():
	sumo_rapido_x = 0
	sumo_rapido_y = 0
	partoj = 1
	for Parto_ in Partoj.get_children():
		if Parto_.get_layer_mask_bit(0):
			rapido = Parto_.get_linear_velocity()
			sumo_rapido_x += abs(rapido.x)
			sumo_rapido_y += abs(rapido.y)
			partoj += 1
	averagxa_rapido_x = sumo_rapido_x / partoj
	averagxa_rapido_y = sumo_rapido_y / partoj
	diferenco = averagxa_rapido_x - averagxa_rapido_y
	if diferenco > 2:
		if not E3_timpani.is_playing():
			E3_timpani.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
		if averagxa_rapido_x > 6:
			E3_tremolo.set_volume_db(-15)
			G3_tremolo.set_volume_db(-3)
			if not G3_tremolo.is_playing():
				G3_tremolo.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
		elif averagxa_rapido_x > 2:
			E3_tremolo.set_volume_db(-3)
			G3_tremolo.set_volume_db(-15)
			if not E3_tremolo.is_playing():
				E3_tremolo.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	elif partoj >= 20:
		if diferenco < -50:
			C3_chimes.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
			T30000.start()
			T500.stop()
	elif partoj < 20:
		if diferenco < -25:
			C4_chimes.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
			T30000.start()
			T500.stop()

func _on_Reen_pressed():
	get_tree().change_scene("res://Menuo.tscn")

func _on_T30000_timeout():
	T500.start()

func _on_Brili_tween_step( object, key, elapsed, value ):
	if elapsed == 0.5:
		vido_Rekordo_Brili.stop_all()

func _on_PreParto_body_enter( korpo ):
	enajxoj.append(korpo)

func _on_PreParto_body_exit( korpo ):
	enajxoj.erase(korpo)