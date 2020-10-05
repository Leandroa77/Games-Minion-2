extends RigidBody2D

var dirUp = Vector2.UP
var dirDown = Vector2.DOWN
var cantCajas = 0
var velocity = Vector2.ZERO
var speed = 900
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta

func moveUp():
	applied_force = dirUp.normalized() * speed


func _on_AreaP2_push():
	cantCajas = cantCajas + 1
	if cantCajas == 2:
		moveUp()
	print("hay", cantCajas,  ":caja/s" )


func _on_AreaP2_pull():
	cantCajas = cantCajas - 1
	print("hay", cantCajas,  ":caja/s" )
