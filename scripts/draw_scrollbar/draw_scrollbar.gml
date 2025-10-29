function draw_scrollbar(scr_id, xx, yy, minimum, maximum, step, length){
	var percent = (scr_value[scr_id] - minimum) / (maximum - minimum)
	var act_length = length - 20
	draw_sprite_stretched(spr_scroller_border, 0, xx, yy, 40, length)
	draw_sprite_stretched(spr_scroller_back, 0, xx + 10, yy + 10, 20, length - 20)
	draw_sprite_stretched(spr_scroller, 0, xx + 5, yy + 10 + act_length * percent, 30, 60)
	
	return scr_value[scr_id]
}