extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal boom

var time = 0.6

var t

var b = false

# Called when the node enters the scene tree for the first time.
func _ready():
	t = [$Sprite.modulate, Color(1, 0.75, 0.75)]
	
	pass # Replace with function body.

func goToExplode():
	$Tween.interpolate_property($Sprite, "modulate", null, Color(1, 0.5, 0.5), time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	b = true
	$Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	b = !b
	
	if b:
		time -= 0.1
		
		if time < 0:
			visible=false
			$AudioStreamPlayer.play()
			emit_signal("boom")
	
	t.invert()
	$Tween.interpolate_property($Sprite, "modulate", null, t[0], time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	queue_free()
	pass # Replace with function body.
