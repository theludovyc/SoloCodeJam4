extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func disableCollider():
	$CollisionShape2D.disabled = true

func _on_Key_open():
	$Tween.interpolate_property($Sprite, "position:x", $Sprite.position.x, $Sprite.position.x-8, 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($Sprite2, "position:x", $Sprite2.position.x, $Sprite2.position.x+8, 3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Tween.start()
	pass # Replace with function body.


func _on_Tween_tween_all_completed():
	call_deferred("disableCollider")
	pass # Replace with function body.
