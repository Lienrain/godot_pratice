extends Base_State

@onready var attack_type:int

func enter():
	if $Timer.is_stopped():
		$"../../AnimationPlayer".play("攻击1")
	else:
		$"../../AnimationPlayer".play("攻击2")
	
func do():
	pass
	
func attack1_check():
	var arr = $"../../attack_check/a1".get_overlapping_bodies()


func attack2l_check():
	var arr = $"../../attack_check/a2l".get_overlapping_bodies()
	
		
func attack2r_check():
	var arr = $"../../attack_check/a2r".get_overlapping_bodies()
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if $"../../AnimatedSprite2D".animation == "攻击1":
		$Timer.start(0.25)
	if $"../../AnimatedSprite2D".animation == "攻击1" || $"../../AnimatedSprite2D".animation == "攻击2":
		get_parent().change_state(0)
