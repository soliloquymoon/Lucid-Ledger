function scene_market(){
	draw_set_color(0)
	draw_text(10, 10, "market scene")
	
	draw_set_color(0)
	draw_frame_solid(161, 97, 1000, 583)
	
	draw_scrollbar(0, 1171, 97, 0, 10, 1, 583)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_transition(SCENE.MAIN)
	}
}