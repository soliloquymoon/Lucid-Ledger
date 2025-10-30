function scene_sell(){
	draw_set_color(0)
	draw_text(10, 10, "sell scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(inventory, 3)
	if (dream_sel != -1) {
		if (show_question("Do you want sell this dream?")) {
			scene_into(SCENE.SELL_INNER)
			dream_to_sell = inventory[dream_sel]
			player_offer_pending = dream_to_sell.dream_value
			current_client = 0
			player_offer_edit = 1
			player_offer = 0
		}
	}
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}