extends Area2D

signal push
signal down
signal pull
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AreaP2_body_entered(body):
	if body.get_name() == "Box":
		emit_signal("push")
		emit_signal("down")
		print("entro caja", body.get_name())
	if body.get_name() == "Box2":
		emit_signal("push")
		emit_signal("down")
		print("entro caja", body.get_name())
	


func _on_AreaP2_body_exited(body):
	if body.get_name() == "Box":
		emit_signal("pull")
		print("salio caja", body.get_name())
	if body.get_name() == "Box2":
		emit_signal("pull")
		print("salio caja", body.get_name())
