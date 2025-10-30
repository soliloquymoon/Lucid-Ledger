function scene_transition(toscene){
	instance_create_depth(0, 0, -1, obj_transition).scene_to = toscene
}