function scene_inventory(){
	draw_set_color(0)
	//draw_text(10, 10, "inventory scene")
	draw_sprite(spr_bg_main, 0, 0, 0)
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(inventory, 1)
	if (dream_sel != -1) {
		set_popup("Inventory", "Do you want edit this dream?", spr_dream_icon, inventory[dream_sel].icon_index)
		popup_temp_value = dream_sel
	}
	if (popup_temp_value != -1 && popup_choice = 1) {
		scene_into(SCENE.EDIT)
		deck = []
		hand = []
		used = []
		hand_limit = 3
		array_copy(deck, 0, all_cards, 0, array_length(all_cards))
		dream_in_edit = inventory[popup_temp_value]
		popup_choice = -1
		popup_temp_value = -1
	}
	
	draw_set_color(c_white)
	if (array_length(inventory) == 0) draw_text(200, 350, "Empty... Maybe go buy a dream?")
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}