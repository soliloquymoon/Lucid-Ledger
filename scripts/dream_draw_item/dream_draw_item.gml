function dream_draw_item(xx, yy, dream, display_price, scale = 1){
	draw_frame_solid(xx, yy, 138 * scale, 138 * scale)
	draw_set_color(0)
	draw_rectangle(xx + 2 * scale, yy + 2 * scale, xx + 135 * scale, yy + 135 * scale, 0)
	draw_sprite_stretched(spr_dream_icon, dream.icon_index, xx + 2 * scale, yy + 2 * scale, 134 * scale, 134 * scale)
	draw_sprite_stretched(spr_value_border, 0, xx + 138 * scale, yy + 19 * scale, 318 * scale, 100 * scale)
	draw_sprite_stretched(spr_value_back, 0, xx + 138 * scale, yy + 21 * scale, 316 * scale, 96 * scale)
	if (display_price) draw_sprite_stretched(spr_frame, 7, xx + 350 * scale, yy + 21 * scale, 4 * scale, 96 * scale)
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_text_transformed(xx + 160 * scale, yy + 40 * scale, dream.dream_name, scale, scale, 0)
	var value_str = "L" + string(dream.dream_value)
	if (display_price) draw_text_transformed(xx + 406 * scale - string_width(value_str) / 2 * scale, yy + 60 * scale, value_str, scale, scale, 0)
	
	var tag_strs = ["", "", "", ""]
	for (var i = 0; i < 4; i++) {
		if (dream.unlocks[i] = 0) tag_strs[i] = "Locked"
		else tag_strs[i] = dream.tags[i].tag_name
	}
	if (dream.unlocks[0]) {
		draw_sprite(spr_tag_back, 0, xx + 160 * scale, yy + 63 * scale)
		draw_sprite(spr_trend_indicator, 0, xx + 187 * scale, yy + 70 * scale)
	} else {
		draw_sprite(spr_tag_back, 4, xx + 160 * scale, yy + 63 * scale)
	}
	set_tooltip(xx + 160 * scale, yy + 63 * scale, 58 * scale, 18 * scale, tag_strs[0])
	if (dream.unlocks[1]) {
	draw_sprite(spr_tag_back, 0, xx + 254 * scale, yy + 63 * scale)
	draw_sprite(spr_trend_indicator, 0, xx + 281 * scale, yy + 70 * scale)
	} else {
		draw_sprite(spr_tag_back, 4, xx + 254 * scale, yy + 63 * scale)
	}
	set_tooltip(xx + 254 * scale, yy + 63 * scale, 58 * scale, 18 * scale, tag_strs[1])
	if (dream.unlocks[2]) {
	draw_sprite(spr_tag_back, 0, xx + 160 * scale, yy + 88 * scale)
	draw_sprite(spr_trend_indicator, 0, xx + 187 * scale, yy + 95 * scale)
	} else {
		draw_sprite(spr_tag_back, 4, xx + 160 * scale, yy + 88 * scale)
	}
	set_tooltip(xx + 160 * scale, yy + 88 * scale, 58 * scale, 18 * scale, tag_strs[2])
	if (dream.unlocks[3]) {
	draw_sprite(spr_tag_back, 0, xx + 254 * scale, yy + 88 * scale)
	draw_sprite(spr_trend_indicator, 0, xx + 281 * scale, yy + 95 * scale)
	} else {
		draw_sprite(spr_tag_back, 4, xx + 254 * scale, yy + 88 * scale)
	}
	set_tooltip(xx + 254 * scale, yy + 88 * scale, 58 * scale, 18 * scale, tag_strs[3])
	
	var a = mouse_rectangle(xx, yy, 138 * scale, 138 * scale) || mouse_rectangle(xx + 138 * scale, yy + 19 * scale, 318 * scale, 100 * scale)
	if (a) a += mouse_check_button(mb_left)
	
	return a
}