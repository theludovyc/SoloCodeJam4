extends Node2D

signal open

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var t = [2, -2]

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Tween.interpolate_property($key, "position:y", $key.position.y, $key.position.y+2, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	$Tween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Tween_tween_completed(object, key):
	t.invert()
	$Tween.interpolate_property(object, key, $key.position.y, $key.position.y+t[0], 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pass # Replace with function body.


func _on_Key_body_entered(body):
	if(body.name == "Player"):
		emit_signal("open")
		queue_free()
	pass # Replace with function body.
