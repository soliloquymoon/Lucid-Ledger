function scene_main(){
	draw_set_color(0)
	//draw_text(10, 10, "main scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	draw_set_font(Font1)
	if (draw_button_size(53, 655, 88, 88, "Settings")) scene_into(SCENE.SETTINGS)
	if (draw_button_size(856 + 120, 655, 88, 88, "Market")) scene_into(SCENE.MARKET)
	if (draw_button_size(856 + 120 + 120, 655, 88, 88, "Sell")) scene_into(SCENE.SELL)
	if (draw_button_size(856 + 120 + 120 + 120, 655, 88, 88, "Workshop")) scene_into(SCENE.INVENTORY)
}