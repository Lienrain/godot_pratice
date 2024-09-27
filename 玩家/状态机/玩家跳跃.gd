extends Base_State

@onready var player:CharacterBody2D = $"../.."
@onready var ani_2d:AnimatedSprite2D = $"../../AnimatedSprite2D"


var SPEED
var y_speed
var x_vel

func enter():
	x_vel = player.velocity.x
	SPEED = 1.5
	y_speed = 300
	ani_2d.play("跳起")
	print("跳起")

func do():
	if y_speed <= 0:
		get_parent().change_state(1)
		return
	if ani_2d.frame >= 2:
		player.velocity.x = x_vel * SPEED
		player.velocity.y = -1 * y_speed
		y_speed -= 10
		player.move_and_slide()
	if Input.is_action_just_pressed("攻击1") or Input.is_action_just_pressed("攻击2") or Input.is_action_just_pressed("攻击3"):
		get_parent().change_state(4)
		return
	
	

	
		
		
