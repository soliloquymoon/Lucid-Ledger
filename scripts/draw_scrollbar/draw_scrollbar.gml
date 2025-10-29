function draw_scrollbar(scr_id, xx, yy, minimum, maximum, step, length){
	var percent = (scr_value[scr_id] - minimum) / (maximum - minimum)
	var act_length = length - 20
	draw_sprite_stretched(spr_scroller_border, 0, xx, yy, 40, length)
	draw_sprite_stretched(spr_scroller_back, 0, xx + 10, yy + 10, 20, length - 20)
	
	if (mouse_rectangle(xx + 5, yy + 10 + act_length * percent, 30, 60) && mouse_check_button_pressed(mb_left) && scr_drag != 1) {
		scr_dragging[scr_id] = 1
		scr_drag = 1
	}
	
	if (mouse_check_button_released(mb_left) && scr_dragging[scr_id] = 1) {
		scr_dragging[scr_id] = 0
		scr_drag = 0
	}
	
	var scroller_x = xx + 5
	var scroller_y = yy + 10 + act_length * percent
	
	if (scr_dragging[scr_id] = 1) {
		scroller_y = mouse_y - 30
		if (scroller_y > yy + 10 + act_length - 60) scroller_y = yy + 10 + act_length - 60
		if (scroller_y < yy + 10) scroller_y = yy + 10
		scr_value[scr_id] = minimum + ((scroller_y - (yy + 10)) / (act_length - 10)) * (maximum - minimum)
		scr_value[scr_id] = ((scr_value[scr_id] - minimum) div step) * step + minimum
		if (scr_value[scr_id] > maximum) scr_value[scr_id] = maximum
		if (scr_value[scr_id] < minimum) scr_value[scr_id] = minimum
	}
	
	draw_sprite_stretched(spr_scroller, 0, scroller_x, scroller_y, 30, 60)
	
	return scr_value[scr_id]
}