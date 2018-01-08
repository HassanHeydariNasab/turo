extends Node

var agordejo = "user://agordejo.cfg"
onready var Agordejo = ConfigFile.new()

var lingvo_elektita = false

var Radiko = null

# modo 0: senfina, modo 1: nivela
var modo = 0
var nivelo = 0

var materialo setget set_materialo

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if get_tree().get_current_scene().get_name() == "Menuo":
			get_tree().quit()
		elif get_tree().get_current_scene().get_name() == "Lingvo" and not T.lingvo_elektita:
			pass
		else:
			get_tree().change_scene("res://Menuo.tscn")

func _ready():
	Agordejo.load(agordejo)

func set_materialo(valoro):
	materialo = int(valoro)
	Radiko.vido_Materialo.set_text(str(materialo))

func get_layer_bit (korpo, bit):
	if korpo extends KinematicBody2D or korpo extends Area2D or\
	korpo extends StaticBody2D:
		return korpo.get_layer_mask_bit(bit)
	elif korpo extends TileMap:
		return korpo.get_collision_layer_bit(bit)