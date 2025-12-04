function draw_tag_list(tag_list, scr_id, display_price = 0){
	draw_set_color(0)
	draw_frame_solid(161, 97, 1000, 583)
	
	var display_length = 6
	if (array_length(tag_list) - scr_value[scr_id] * 2 < 6) display_length = array_length(tag_list) - scr_value[scr_id] * 2
	
	var row = 0
	var column = 0
	var tag_sel = -1
	for (var i = scr_value[scr_id] * 2; i < scr_value[scr_id] * 2 + display_length; i++) {
		if (tag_draw_item(190 + 480 * column, 178 + 158 * row, tag_list[i], display_price) && window = 0) {
			if (mouse_check_button_released(mb_left)) tag_sel = i
			window_set_cursor(cr_handpoint)
		}
		column++
		if (column = 2) {
			row++
			column = 0
		}
	}
	
	draw_scrollbar(scr_id, 1171, 97, 0, array_length(tag_list) div 2, 1, 583)
	return tag_sel
}