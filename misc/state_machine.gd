class_name StateMachine
extends Node


class StateFlow:
	var state_name: String:
		get:
			return state_name
	var state: Callable:
		get:
			return state
	var enter_state: Callable:
		get:
			return enter_state
	var leave_state: Callable:
		get:
			return leave_state

	func _init(p_state_name: String, p_state: Callable, p_enter_state: Callable, p_leave_state: Callable) -> void:
		state_name = p_state_name
		state = p_state
		enter_state = p_enter_state
		leave_state = p_leave_state


var current_state_name: String = ""
var current_state: Callable = Callable()
var states: Dictionary = {}


func add_state(state_name: String, state: Callable, enter_state: Callable, leave_state: Callable) -> void:
	var state_flow: StateFlow = StateFlow.new(state_name, state, enter_state, leave_state)
	states[state_name] = state_flow


func set_state(state_flow: StateFlow) -> void:
	if current_state:
		var old_state_flow: StateFlow = states.get(current_state_name)
		if old_state_flow and old_state_flow.leave_state and old_state_flow.leave_state.get_object():
			old_state_flow.leave_state.call()

	current_state = state_flow.state
	current_state_name = state_flow.state_name

	if state_flow.enter_state and state_flow.enter_state.get_object():
		state_flow.enter_state.call()


func change_state(state: String) -> void:
	var state_flow: StateFlow = states.get(state)
	if state_flow:
		Callable(func() -> void: set_state(state_flow)).call_deferred()


func set_initial_state(state: String) -> void:
	var state_flow: StateFlow = states.get(state)
	if state_flow:
		set_state(state_flow)


func get_current_state() -> Callable:
	return current_state


func update() -> void:
	current_state.call()
