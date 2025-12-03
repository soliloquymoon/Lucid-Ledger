function scene_main(){
	draw_set_color(0)
	//draw_text(10, 10, "main scene")
	draw_sprite(spr_bg_main, 0, 0, 0)
	
	if (!text_prologue_shown) {
		set_dialogue(0, text_prologue, text_prologue_role)
		text_prologue_shown = 1
	}
	
	if (window = 0) {
		if (!arrow_newspaper_shown) {
			set_arrow(39 + 20, 80 + 78 + 10, 0)
			arrow_newspaper_shown = 1
		}
	}
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	draw_set_alpha(0.5)
	draw_frame_solid(39, 80 + 5, 1366 - 39 - 39, 78 - 10)
	draw_set_alpha(1)
	draw_text(39 + 85 + 10, 80 + 20, "Event: " + get_event(current_event).event_name)
	draw_sprite(spr_news_icon, 0, 39, 80)
	if (button_area(39, 80, 85, 78) && (window = 0 || window = WINDOWS.ARROW)) {
		set_newspaper(get_event(current_event).event_desc, get_event(current_event).event_name)
		if (!text_newspaper_shown) {
			set_dialogue(0, text_newspaper, text_newspaper_role)
			text_newspaper_shown = 1
		}
	}
	
	draw_set_font(Font1)
	if (draw_button_size(53, 655, 88, 88, "Settings") && window = 0) scene_into(SCENE.SETTINGS)
	if (draw_button_size(856 + 120, 655, 88, 88, "Market", text_newspaper_shown = 0) && window = 0) scene_into(SCENE.MARKET)
	if (draw_button_size(856 + 120 + 120, 655, 88, 88, "Sell", array_length(inventory) = 0 || text_editing_shown = 0) && window = 0) scene_into(SCENE.SELL)
	if (draw_button_size(856 + 120 + 120 + 120, 655, 88, 88, "Workshop", array_length(inventory) = 0) && window = 0) scene_into(SCENE.INVENTORY)
	if (draw_button_size(856 + 120 + 120 + 120, 655 - 100, 88, 88, "Cyberwares", cyberware_accessible = 0) && window = 0) scene_into(SCENE.UPGRADE)
}