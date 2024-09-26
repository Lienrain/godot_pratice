extends Base_State

@onready var ain:AnimationPlayer = $"../../AnimationPlayer"
@onready var knight:CharacterBody2D = $"../.."
@onready var a1:Area2D = $"../../attack_check/a1"
@onready var a2l:Area2D = $"../../attack_check/a2l"

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var direct:Vector2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func enter():
	if $"../../AnimatedSprite2D".flip_h == true:
		direct = Vector2.LEFT
	else :
		direct = Vector2.RIGHT
	ain.play("奔跑动画")
	
func do():
	if !is_instance_valid($"../../right".get_collider()):
		direct = Vector2.LEFT
		$"../../attack_check".scale.x = -1
		$"../../AnimatedSprite2D".flip_h = true
	elif !is_instance_valid($"../../left".get_collider()):
		direct = Vector2.RIGHT
		$"../../AnimatedSprite2D".flip_h = false
	
	
	
	var arr:Array=a1.get_overlapping_bodies()

	if arr.size() > 1:
		get_parent().change_state(2)
		return
		
	if !($"../../左攻击检测".get_collider() is CharacterBody2D or $"../../右攻击检测".get_collider() is CharacterBody2D):
		get_parent().change_state(0)
		return	
		
	knight.velocity = direct * SPEED
	knight.velocity.y = gravity
	knight.move_and_slide()
