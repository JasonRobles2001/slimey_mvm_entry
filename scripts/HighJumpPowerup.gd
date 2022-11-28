extends Area2D



func onPlayerEntered(_body):
	queue_free()
	GlobalVariables.canHighJump = true;
	GlobalFuntions.PowerUpCountdown()
