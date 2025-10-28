function scene_market(){
	draw_set_color(0)
	draw_text(10, 10, "market scene")
	
	draw_set_color(0)
	draw_rectangle(161, 97, 1231, 680, 1)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_transition(SCENE.MAIN)
	}
}