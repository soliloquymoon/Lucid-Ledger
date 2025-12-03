function window_arrow(){
	arrow_offset_x = 0
	arrow_offset_y = 0
	if (arrow_direction = 0) {
		arrow_offset_y = arrow_offset
	} else if (arrow_direction = 1) {
		arrow_offset_x = arrow_offset * -1
	} else if (arrow_direction = 2) {
		arrow_offset_y = arrow_offset * -1
	} else if (arrow_direction = 3) {
		arrow_offset_x = arrow_offset
	}
	draw_sprite(spr_arrow, arrow_direction, arrow_pos[0] + arrow_offset_x, arrow_pos[1] + arrow_offset_y)
	if (arrow_move_direction = 0) {
		arrow_offset++
		if (arrow_offset > 10) arrow_move_direction = 1
	} else {
		arrow_offset--
		if (arrow_offset < 0) arrow_move_direction = 0
	}
}