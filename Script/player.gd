extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal lose_life

var life = 3

const SPEED = 1.0

var dir

var t

var b:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	t = [modulate, Color(1, 0, 0)]
	
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
	if body.is_in_group("Blades"):
		if $Tween.is_active():
			$Tween.stop_all()
		
		$Tween.interpolate_property($Head, "modulate", t[0], t[1], 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		
		var dir = body.global_position.direction_to(global_position)
		
		apply_central_impulse(-linear_velocity + dir*20)
		
		if $Bomb != null:
			$Bomb.explode()
		
		life -= 1
		
		if life <= 0:
			get_tree().reload_current_scene()
		
		emit_signal("lose_life")
		
		b=true
	pass # Replace with function body.


func _on_Tween_tween_completed(object, key):
	if b:
		$Tween.interpolate_property($Head, "modulate", t[1], t[0], 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		b = false
	pass # Replace with function body.
