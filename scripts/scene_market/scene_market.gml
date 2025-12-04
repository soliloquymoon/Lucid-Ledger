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
	
	if (market_page = 0) {
	
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
		
		draw_sprite(spr_triangle, 0, 1366 - 50 - 64, 100)
		if (button_area(1366 - 50 - 64, 100, 64, 64) && window = 0) market_page = 1
	
	} else {
		
		var tag_sel = draw_tag_list(tags, 4, 1)
		if (tag_sel != -1) {
			set_popup("Market", "Do you want to buy one of this tag for " + string(tags[tag_sel].base_value) + " lunites?", spr_tag_icon, 0)
			popup_temp_value = tag_sel
		}
		if (popup_temp_value != -1 && popup_choice = 1) {
			if (money >= tags[popup_temp_value].base_value) {
				money -= tags[popup_temp_value].base_value
				array_push(inventory_tags, tags[popup_temp_value])
			} else {
				show_message("Not enough lunites.")
			}
			popup_choice = -1
			popup_temp_value = -1
		}
		
		draw_sprite(spr_triangle, 1, 50, 100)
		if (button_area(50, 100, 64, 64) && window = 0) market_page = 0
		
	}
	
	draw_set_font(Font1)
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}