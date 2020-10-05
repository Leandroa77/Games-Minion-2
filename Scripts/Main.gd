extends Node

var stage1
var stage2
var violeta
var isStage2

var sceneStage2 = preload("res://Stage2.tscn")
var sceneVioleta = preload("res://Violeta.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Stage1/Boxes/Box.violeta = $Violeta
	$Stage1/Boxes/Box2.violeta = $Violeta
	
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _on_Violeta_nextLevel():
	if isStage2:
		print("Termino el juego")
		violeta.hide()
	else:
		remove_child($Stage1)
		remove_child($Violeta)
		changeLevel()
	
	
func changeLevel():
	stage2 = sceneStage2.instance()
	add_child(stage2)
	violeta = sceneVioleta.instance()
	add_child(violeta)
	stage2.get_node("Box").violeta = violeta
	stage2.get_node("Box2").violeta = violeta
	stage2.get_node("Box3").violeta = violeta
	stage2.get_node("Box4").violeta = violeta
	isStage2 = true
