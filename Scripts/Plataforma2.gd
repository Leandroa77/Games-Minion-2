extends RigidBody2D
var force
var dirDown = Vector2.DOWN
var dirUp = Vector2.UP
signal push
signal pull
signal pindown
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Plataforma2_body_entered(body):
	if body.get_name() == "Box":
		emit_signal("push")
		print("entro caja", body.get_name())
	if body.get_name() == "Box2":
		emit_signal("push")
		print("entro caja", body.get_name())

func _on_Plataforma2_body_exited(body):
	if body.get_name() == "Box":
		emit_signal("pull")
		print("salio caja", body.get_name())
	if body.get_name() == "Box2":
		emit_signal("pull")
		print("salio caja", body.get_name())
