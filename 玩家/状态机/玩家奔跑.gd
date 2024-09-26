extends Base_State

@onready var player:CharacterBody2D = $"../.."
@onready var ani_2d:AnimatedSprite2D = $"../../AnimatedSprite2D"

const SPEED = 150.0

func enter():
	ani_2d.play("奔跑")
	print("奔跑")
	
func do():


	
	var vec:Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("左移","右移")
	if vec.x == 0:
		get_parent().change_state(0)
		return
	elif vec.x > 0:
		ani_2d.flip_h=false
		$"../../attack_check".scale.x = -1
		
	else:
		ani_2d.flip_h = true
		$"../../attack_check".scale.x = 1
	
	player.velocity = vec * SPEED
	player.velocity.y = 1
	player.move_and_slide()
	
		
	
