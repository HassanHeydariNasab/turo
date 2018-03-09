extends Control

onready var Fono = get_node("Fono")

func _ready():
	Fono.set_color(T.koloroj[T.Agordejo.get_value("Koloro", "fonkoloro", "Griza")])
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Fontkodo_pressed():
	OS.shell_open("https://github.com/HassanHeydariNasab/turo")

func _on_Atribuoj_pressed():
	OS.shell_open("https://github.com/HassanHeydariNasab/turo/blob/master/ATRIBUOJ.md")

func _on_Bitcoin_pressed():
	OS.shell_open("bitcoin:1PUJ5sFWxvbx5Np2CjFmhHFnzPe2GPvinj")

func _on_Litecoin_pressed():
	OS.shell_open("litecoin:LgeGeVU9JAxyXpanPtsBRAX5QHxvUJo8id")

func _on_Ethereum_pressed():
	OS.shell_open("ethereum:0x8472eb39e5bddd14173bce4ed06e287876fb2f2c")

func _on_Reen_pressed():
	get_tree().change_scene("res://Menuo.tscn")