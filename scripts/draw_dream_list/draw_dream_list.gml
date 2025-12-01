function draw_dream_list(dream_list, scr_id, display_price = 0){
	draw_set_color(0)
	draw_frame_solid(161, 97, 1000, 583)
	
	var display_length = 6
	if (array_length(dream_list) - scr_value[scr_id] * 2 < 6) display_length = array_length(dream_list) - scr_value[scr_id] * 2
	
	var row = 0
	var column = 0
	var dream_sel = -1
	for (var i = scr_value[scr_id] * 2; i < scr_value[scr_id] * 2 + display_length; i++) {
		if (dream_draw_item(190 + 480 * column, 178 + 158 * row, dream_list[i], display_price) && window = 0) {
			if (mouse_check_button_released(mb_left)) dream_sel = i
			window_set_cursor(cr_handpoint)
		}
		column++
		if (column = 2) {
			row++
			column = 0
		}
	}
	
	draw_scrollbar(0, 1171, 97, 0, array_length(dream_list) div 2, 1, 583)
	return dream_sel
}