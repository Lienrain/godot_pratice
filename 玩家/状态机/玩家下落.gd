extends Base_State

@onready var player = $"../.."
@onready var ani_2d = $"../../AnimatedSprite2D"

var SPEED = 100
var y_speed
var x_vel

func enter():
	x_vel = player.velocity.x
	print(x_vel)
	y_speed = 0
	ani_2d.play("降落")
	print("下落")
	
func do():
	var d = Input.get_axis("左移","右移") * SPEED

	if y_speed <= 300:
		y_speed += 10
		
	if player.is_on_floor():
		get_parent().change_state(0)
		return
		
	
	
	player.velocity.x = x_vel + d
	if player.velocity.x > 300:
		player.velocity.x = 300
		
	elif player.velocity.x < -300:
		player.velocity.x = -300
	player.velocity.y = y_speed
	
	if Input.is_action_just_pressed("攻击1") or Input.is_action_just_pressed("攻击2") or Input.is_action_just_pressed("攻击3"):
		get_parent().change_state(4)
		return
		
	if player.velocity.x > 0:
		ani_2d.flip_h=false
		$"../../attack_check".scale.x = -1
	elif player.velocity.x < 0:
		ani_2d.flip_h=true
		$"../../attack_check".scale.x = 1
		
	player.move_and_slide()
	
	
	
	
	
	
	
	
