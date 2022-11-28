extends Node

#powerup countdown timer
func PowerUpCountdown():
    GlobalVariables.hasPowerup = true
    yield(get_tree().create_timer(5), "timeout")
    GlobalVariables.hasPowerup = false
    print("Player doesn't have powerup anymore")