extends Base_State

@onready var player:CharacterBody2D = $"../.."
@onready var ani_2d:AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter():
	ani_2d.play("闲置")
	print("闲置")
	
func do():
	
	if Input.is_action_just_pressed("左移") or Input.is_action_just_pressed("右移"):
		get_parent().change_state(2)
	
