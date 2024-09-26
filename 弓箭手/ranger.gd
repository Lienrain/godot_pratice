extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direct:Vector2 = Vector2.RIGHT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack:bool

func _ready() -> void:
	$AnimatedSprite2D.play("奔跑")

func _physics_process(delta: float) -> void:
	if !is_instance_valid($right.get_collider()):
		direct = Vector2.LEFT
		$AnimatedSprite2D.flip_h = true
	if !is_instance_valid($left.get_collider()):
		direct = Vector2.RIGHT
		$AnimatedSprite2D.flip_h = false
		
	if is_instance_valid($右攻击检测.get_collider())and direct == Vector2.RIGHT and attack == false:
		$AnimatedSprite2D.play("攻击")
		return
	elif is_instance_valid($左攻击检测.get_collider())and direct == Vector2.LEFT and attack == false:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("攻击")
		return
	
	if attack == true:
		return
	
	
	velocity = direct * SPEED
	velocity.y = gravity
	move_and_slide()
	

func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "攻击":
		if $AnimatedSprite2D.frame == 8:
			attack = true
			var sce = preload("res://弓箭手/弓箭.tscn").instantiate()
			if direct == Vector2.RIGHT:
				sce.position = $"右弓箭".global_position
				get_parent().add_child(sce)
			else:
				sce.position = $"左弓箭".global_position
				sce.vex = direct.x
				get_parent().add_child(sce)



func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "攻击":
		attack = false
		$AnimatedSprite2D.play("奔跑")
