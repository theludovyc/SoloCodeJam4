extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 1.0

var dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if $Bomb != null:
			var v = $Bomb
			remove_child(v)
			get_parent().add_child(v)
			v.position = Vector2(position.x, position.y-1)
			v.mode = MODE_CHARACTER
			v.get_node("CollisionShape2D").disabled=false
			v.apply_central_impulse(linear_velocity)
			v.goToExplode()
	
	pass

func _physics_process(delta):
	dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		$Head.frame = 0
		dir.y += 1
		
	if Input.is_action_pressed("ui_up"):
		$Head.frame = 1
		dir.y -= 1
		
	if Input.is_action_pressed("ui_left"):
		$Head.frame = 2
		$Head.flip_h = true
		dir.x -= 1
	
	if Input.is_action_pressed("ui_right"):
		$Head.flip_h = false
		$Head.frame = 2
		dir.x += 1
	
	apply_central_impulse(dir*SPEED)


func _on_Player_body_entered(body):
	pass # Replace with function body.
