function scene_inventory(){
	draw_set_color(0)
	draw_text(10, 10, "inventory scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	draw_set_color(0)
	draw_frame_solid(161, 97, 1000, 583)
	
	draw_scrollbar(0, 1171, 97, 0, 10, 1, 583)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_transition(last_scene)
	}
}