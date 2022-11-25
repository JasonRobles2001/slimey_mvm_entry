extends Area2D



func onPlayerEntered(body):
	queue_free()
	print("Door Unlocked");
