function scene_sell(){
	draw_set_color(0)
	//draw_text(10, 10, "sell scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(inventory, 3)
	if (dream_sel != -1) {
		set_popup("Sell", "Do you want sell this dream?\n\nTip: You can enhance the dream in the workshop.", spr_dream_icon, inventory[dream_sel].icon_index)
		popup_temp_value = dream_sel
	}
	if (popup_temp_value != -1 && popup_choice = 1) {
		scene_into(SCENE.SELL_INNER)
		dream_to_sell = inventory[popup_temp_value]
		player_offer_pending = dream_to_sell.dream_value
		current_client = 0
		player_offer_edit = 1
		player_offer = 0
		popup_choice = -1
		popup_temp_value = -1
	}
	
	draw_set_color(c_white)
	if (array_length(inventory) == 0) draw_text(200, 350, "Empty... Maybe go buy a dream?")
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}