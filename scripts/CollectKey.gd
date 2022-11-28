extends Area2D



func onPlayerEntered(_body):
	queue_free()
	print("Door Unlocked");
