extends Node

var Radiko = null

var materialo setget set_materialo

func set_materialo(valoro):
	materialo = int(valoro)
	Radiko.vido_Materialo.set_text(str(materialo))

func get_layer_bit (korpo, bit):
	if korpo extends KinematicBody2D or korpo extends Area2D or\
	korpo extends StaticBody2D:
		return korpo.get_layer_mask_bit(bit)
	elif korpo extends TileMap:
		return korpo.get_collision_layer_bit(bit)