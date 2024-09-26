class_name FSM
extends Node

@onready var states:Array=[]
@onready var current:Base_State = $run

func _ready() -> void:
	states = get_children()
	current.enter()

func _physics_process(delta: float) -> void:

	current.do()
	
func change_state(id:int)->void:
	current.exit()
	current = states[id]
	current.enter()
