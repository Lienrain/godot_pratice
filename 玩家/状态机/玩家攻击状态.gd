extends Base_State

@onready var attack_type:int
@onready var ani_2d = $"../../AnimatedSprite2D"
@onready var player = $"../.."
@onready var attack_check_1 = $"../../attack_check/a1"
@onready var attack_check_2 = $"../../attack_check/a2"
@onready var attack_check_3 = $"../../attack_check/a3"
@onready var achekc = $"../../air_attack_3_floor_check"

func enter():
	attack_type = 0
	if Input.is_action_just_pressed("攻击1"):
		if !player.is_on_floor():
			ani_2d.play("跳跃攻击1")
			attack_type = 4
			print("跳跃攻击2")
			return
			
		ani_2d.play("攻击1")
		attack_type = 1
		print("攻击1")
		
	elif Input.is_action_just_pressed("攻击2"):
		if !player.is_on_floor():
			ani_2d.play("跳跃攻击2")
			attack_type = 5
			print("跳跃攻击2")
			return
		ani_2d.play("攻击2")
		attack_type = 2
		print("攻击2")
		
	elif Input.is_action_just_pressed("攻击3"):
		if !player.is_on_floor():
			ani_2d.play("跳跃攻击3")
			attack_type = 6
			print("跳跃攻击3")
			player.velocity.x = 0
			player.velocity.y = 200
			return
			
		ani_2d.play("攻击3")
		attack_type = 3
		print("攻击2")

func do():
	if attack_type == 6:
		if ani_2d.frame == 1 and !(achekc.get_collider() is StaticBody2D or achekc.get_collider() is CharacterBody2D ):
			ani_2d.pause()
		elif achekc.get_collider() is StaticBody2D or achekc.get_collider() is CharacterBody2D:
			ani_2d.play()
		player.move_and_slide()
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if ani_2d.animation == "攻击1" or ani_2d.animation == "攻击2" or ani_2d.animation == "攻击3" or ani_2d.animation == "跳跃攻击1" or ani_2d.animation == "跳跃攻击2" or ani_2d.animation == "跳跃攻击3":
		if player.is_on_floor():
			get_parent().change_state(0)
		else:
			get_parent().change_state(1)
