function dream_draw_item(xx, yy, dream, display_price, scale = 1){
	draw_frame_solid(xx, yy, 138 * scale, 138 * scale)
	draw_sprite_stretched(spr_dream_icon, 0, xx + 2 * scale, yy + 2 * scale, 134 * scale, 134 * scale)
	draw_sprite_stretched(spr_value_border, 0, xx + 138 * scale, yy + 19 * scale, 318 * scale, 100 * scale)
	draw_sprite_stretched(spr_value_back, 0, xx + 138 * scale, yy + 21 * scale, 316 * scale, 96 * scale)
	if (display_price) draw_sprite_stretched(spr_frame, 7, xx + 350 * scale, yy + 21 * scale, 4 * scale, 96 * scale)
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_text_transformed(xx + 160 * scale, yy + 40 * scale, dream.dream_name, scale, scale, 0)
	var value_str = "L" + string(dream.dream_value)
	if (display_price) draw_text_transformed(xx + 406 * scale - string_width(value_str) / 2 * scale, yy + 60 * scale, value_str, scale, scale, 0)
	
	var a = mouse_rectangle(xx, yy, 138 * scale, 138 * scale) || mouse_rectangle(xx + 138 * scale, yy + 19 * scale, 318 * scale, 100 * scale)
	if (a) a += mouse_check_button(mb_left)
	
	return a
}