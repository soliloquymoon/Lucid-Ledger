function scene_market(){
	draw_set_color(0)
	//draw_text(10, 10, "market scene")
	
	market_fill()
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(market, 0, 1)
	if (dream_sel != -1) {
		widget_set_caption("Lucid Ledger")
		if (show_question("Do you want to buy this dream for " + string(market[dream_sel].dream_value) + " lunites?")) {
			if (money >= market[dream_sel].dream_value) {
				money -= market[dream_sel].dream_value
				array_push(inventory, market[dream_sel])
				array_delete(market, dream_sel, 1)
			} else {
				show_message("Not enough lunites.")
			}
		}
	}
	
	draw_set_font(Font1)
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}