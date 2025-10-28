function scene_sell(){
	draw_set_color(0)
	draw_text(10, 10, "sell scene")
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_transition(SCENE.MAIN)
	}
}