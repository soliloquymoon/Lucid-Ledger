function scene_exit(){
	array_pop(scene_stack)
	scene_transition(scene_stack[array_length(scene_stack) - 1])
}