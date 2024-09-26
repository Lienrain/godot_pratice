extends Area2D

var vex:float = 1.0
var hitted:bool = false
var timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if vex < 0:
		scale.x = -1
	connect("body_entered", Callable(self, "_on_body_entered"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x += vex * 10
	if hitted:
		timer += delta
	if timer >= 10:
		queue_free()
	

func _on_body_entered(body:Node) -> void:
	if !hitted:
		vex = 0
		$Sprite2D.visible = false
		if body == StaticBody2D:
			$AnimatedSprite2D.play("弓箭击中")
			$AnimatedSprite2D.visible = true
		else:
			queue_free()
		hitted = true
