extends Area2D

signal open

var b = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func emit_open():
	b = true
	emit_signal("open")


func _on_Receiver_body_entered(body):
	if (!b and body.is_in_group("Bombs")):
		body.mode = RigidBody2D.MODE_STATIC
		body.linear_velocity = Vector2.ZERO
		body.sleeping=true
		body.connect("boom", self, "emit_open")
#		body.position = position
		
	pass # Replace with function body.
