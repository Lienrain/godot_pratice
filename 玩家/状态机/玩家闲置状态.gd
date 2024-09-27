extends Base_State

@onready var player:CharacterBody2D = $"../.."
@onready var ani_2d:AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter():
	ani_2d.play("闲置")
	print("闲置")
	player.velocity.x = 0
	
func do():
	if Input.is_action_just_pressed("jump"):
		get_parent().change_state(3)
		return
		
	if Input.is_action_just_pressed("攻击1") or Input.is_action_just_pressed("攻击2") or Input.is_action_just_pressed("攻击3"):
		get_parent().change_state(4)
		return
	
	var vec:Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("左移","右移")
	if vec.x != 0:
		get_parent().change_state(2)
		return
		
	if !player.is_on_floor():
		get_parent().change_state(1)
	
