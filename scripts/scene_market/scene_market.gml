function scene_market(){
	draw_set_color(0)
	//draw_text(10, 10, "market scene")
	draw_sprite(spr_bg_main, 0, 0, 0)
	
	if (!text_market_shown) {
		set_dialogue(0, text_market, text_market_role)
		text_market_shown = 1
	}
	
	market_fill()
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(market, 0, 1)
	if (dream_sel != -1) {
		set_popup("Market", "Do you want to buy this dream for " + string(market[dream_sel].dream_value) + " lunites?", spr_dream_icon, market[dream_sel].icon_index)
		popup_temp_value = dream_sel
	}
	if (popup_temp_value != -1 && popup_choice = 1) {
		if (money >= market[popup_temp_value].dream_value) {
			money -= market[popup_temp_value].dream_value
			array_push(inventory, market[popup_temp_value])
			array_delete(market, popup_temp_value, 1)
		} else {
			show_message("Not enough lunites.")
		}
		popup_choice = -1
		popup_temp_value = -1
	}
	
	draw_set_font(Font1)
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}