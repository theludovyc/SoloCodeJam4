extends Area2D

var pref_bomb = preload("res://Scene/Bomb.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bomb_take = false

func pop_bomb():
	var b = pref_bomb.instance()
	add_child(b)

# Called when the node enters the scene tree for the first time.
func _ready():
	pop_bomb()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_popper_bomb_body_entered(body):
	if !bomb_take:
		if (body.name == "Player"):
			var bomb = $Bomb
			remove_child(bomb)
			body.add_child(bomb)
			bomb.connect("boom", self, "pop_bomb")
			bomb.position.y -= 2
			body.move_child(bomb, 1)
			bomb_take = true
	pass # Replace with function body.
