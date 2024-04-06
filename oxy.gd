extends ProgressBar

var maxOxygen = 100  # Maximum oxygen level
var currentOxygen = maxOxygen  # Current oxygen level
var depletionRate = 1  # Oxygen depletion rate per second

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_max(maxOxygen)  # Set the maximum value for the progress bar
	set_value(maxOxygen)  # Set initial oxygen level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentOxygen -= depletionRate * delta  # Decrease oxygen level over time
	if currentOxygen <= 0:  # Ensure oxygen level doesn't go below 0
		currentOxygen = 0
	set_value(currentOxygen)  # Update the progress bar value
