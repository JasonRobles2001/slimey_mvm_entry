extends Area2D


# When the player collides with double jump powerup, destroy the power up, and set double jump flag to true.
func onPlayerEntered(_body):
	queue_free()
	GlobalVariables.canDoubleJump = true;
	GlobalFuntions.PowerUpCountdown()

