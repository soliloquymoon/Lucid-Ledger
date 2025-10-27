function scene_main(){
	draw_set_color(0)
	draw_text(10, 10, "main scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(1017, 18, "Day " + string(day_counter), string(rounds))
	
	draw_set_font(Font1)
	if (draw_button_size(53, 655, 88, 88, "Settings")) show_debug_message("settings")
	if (draw_button_size(856, 655, 88, 88, "Market")) scene_transition(SCENE.MARKET)
	if (draw_button_size(856 + 120, 655, 88, 88, "Sell")) scene_transition(SCENE.SELL)
	if (draw_button_size(856 + 120 + 120, 655, 88, 88, "Inventory")) show_debug_message("inventory")
	if (draw_button_size(856 + 120 + 120 + 120, 655, 88, 88, "Workshop")) scene_transition(SCENE.EDIT)
}