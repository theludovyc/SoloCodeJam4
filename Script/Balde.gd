extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var follow = $PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.interpolate_property($PathFollow2D2, "unit_offset", 0, 1, 10, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	$Tween2.interpolate_property($PathFollow2D, "unit_offset", 0, 1, 10, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween2.start()
	$Tween2.seek(5)
#	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	follow.set_offset(follow.get_offset() + 100)
#	pass
