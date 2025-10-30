function scene_settings(){
	draw_set_color(0)
	draw_text(10, 10, "sertings scene")
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}