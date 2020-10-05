extends RigidBody2D

var fly = Vector2.UP
var violeta:Violeta
var jump
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _integrate_forces(state):
	pass
	
func move(viewport, event, shape_idx):
	if violeta.position.distance_to(global_position) < 300:
		if event.is_action_pressed("click_left"):
			apply_central_impulse(fly * 50)
		if Input.is_action_pressed("click_right"):
			findDirection()
			apply_central_impulse(jump * 25)


func findDirection():
	if (position.x - violeta.position.x) > 0:
		jump = Vector2.RIGHT
	else:
		jump = Vector2.LEFT
