extends Node

var Radiko = null

var materialo setget set_materialo

func set_materialo(valoro):
	materialo = valoro
	Radiko.vido_Materialo.set_text(str(valoro))