function scene_into(toscene){
	array_push(scene_stack, toscene)
	scene_transition(toscene)
}