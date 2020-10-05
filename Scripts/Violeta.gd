extends RigidBody2D
class_name Violeta

var dirRight = Vector2.RIGHT
var dirLeft = Vector2.LEFT
var jump = Vector2.UP
var jumping = false
signal nextLevel
var portalActive = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state):
	move()
	if portalActive and Input.is_action_pressed("ui_accept"):
		emit_signal("nextLevel")
	
	
func move():
	if Input.is_action_pressed('ui_right'):
		apply_central_impulse(dirRight * 8)
	if Input.is_action_pressed('ui_left'):
		apply_central_impulse(dirLeft * 8)
	jump()
	
func jump():
	if not jumping:
		if Input.is_key_pressed(KEY_SPACE) and Input.is_action_just_pressed("ui_select"):
			apply_central_impulse(jump * 140)
			#set_axis_velocity(Vector2(0, -60))
			jumping = true
			yield(get_tree().create_timer(1.2), "timeout")
			jumping = false

func _on_Violeta_nextLevel():
	portalActive = true
