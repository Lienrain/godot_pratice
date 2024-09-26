extends Base_State

@onready var ain:AnimationPlayer = $"../../AnimationPlayer"
@onready var knight:CharacterBody2D = $"../.."


const SPEED = 40.0
const JUMP_VELOCITY = -400.0

var direct:Vector2 = Vector2.RIGHT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var arr:Array = []


func enter():
	ain.play("走路动画")
	
func do():
	if !is_instance_valid($"../../right".get_collider()):
		direct = Vector2.LEFT
		$"../../attack_check".scale.x = -1
		$"../../AnimatedSprite2D".flip_h = true
	elif !is_instance_valid($"../../left".get_collider()):
		direct = Vector2.RIGHT
		$"../../AnimatedSprite2D".flip_h = false
	
	if $"../../左攻击检测".get_collider() is CharacterBody2D or $"../../右攻击检测".get_collider() is CharacterBody2D:
		get_parent().change_state(1)
		return	
		
	knight.velocity = direct * SPEED
	knight.velocity.y = gravity
	knight.move_and_slide()
