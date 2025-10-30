function scene_sell(){
	draw_set_color(0)
	draw_text(10, 10, "sell scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	draw_dream_list(inventory, 2)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}