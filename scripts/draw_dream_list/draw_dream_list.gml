function draw_dream_list(dream_list, scr_id){
	draw_set_color(0)
	draw_frame_solid(161, 97, 1000, 583)
	
	var display_length = 6
	if (array_length(dream_list) - scr_value[scr_id] * 2 < 6) display_length = array_length(dream_list) - scr_value[scr_id] * 2
	
	var row = 0
	var column = 0
	for (var i = scr_value[scr_id] * 2; i < scr_value[scr_id] * 2 + display_length; i++) {
		dream_draw_item(190 + 480 * column, 178 + 158 * row, dream_list[i])
		column++
		if (column = 2) {
			row++
			column = 0
		}
	}
	
	draw_scrollbar(0, 1171, 97, 0, array_length(dream_list) div 2, 1, 583)
}