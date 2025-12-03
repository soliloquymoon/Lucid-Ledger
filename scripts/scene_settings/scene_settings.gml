function scene_settings(){
	draw_set_color(0)
	//draw_text(10, 10, "sertings scene")
	draw_sprite(spr_bg_generic, 0, 0, 0)
	
	draw_set_color(c_white)
	draw_set_font(Font2)
	draw_text(50, 50, "Settings")
	
	if (draw_checkbox(50, 100, config_sounds, "Sounds")) {
		config_sounds = !config_sounds
		if (config_sounds = 0 && bg_music != -1) {
			audio_stop_all()
			bg_music = -1
		}
	}
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}