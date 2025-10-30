function scene_inventory(){
	draw_set_color(0)
	draw_text(10, 10, "inventory scene")
	
	draw_lunite_display(39, 18, money)
	draw_time_display(980, 18, string(day_counter), string(8 + (rounds - 1) * 3) + ":00")
	
	var dream_sel = draw_dream_list(inventory, 1)
	if (dream_sel != -1) {
		if (show_question("Do you want edit this dream?")) {
			scene_into(SCENE.EDIT)
			dream_in_edit = inventory[dream_sel]
		}
	}
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}