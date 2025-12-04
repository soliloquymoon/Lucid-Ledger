function dream_draw_item_edit(xx, yy, dream, display_price, scale = 1){
	draw_set_color(0)
	draw_sprite_stretched(spr_dream_icon, dream.icon_index, xx, yy, 180 * scale, 180 * scale)
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_text_transformed(xx, yy + 200 * scale, dream.dream_name, scale, scale, 0)
	
	var tag_strs = ["", "", "", ""]
	for (var i = 0; i < 4; i++) {
		if (dream.unlocks[i] = 0) tag_strs[i] = "Locked"
		else {
			tag_strs[i] = dream.tags[i].tag_name
			if (cyberwares_level[2] >= 1) tag_strs[i] += "\nBase value: " + string(dream.tags[i].base_value)
		}
	}
	gpu_set_tex_filter(0)
	if (dream.unlocks[0]) {
		draw_sprite_ext(spr_tag_back, 0, xx, yy + 234 * scale, 2 * scale, 2 * scale, 0, -1, 1)
		draw_sprite_ext(spr_trend_indicator, ord(string_char_at(tag_strs[0], 1)) mod 4, xx, yy + 234 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	} else {
		draw_sprite_ext(spr_tag_back, 4, xx, yy + 234 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	}
	set_tooltip(xx, yy + 234 * scale, 116 * scale, 36 * scale, tag_strs[0])
	if (dream.unlocks[1]) {
		draw_sprite_ext(spr_tag_back, 0, xx, yy + 286 * scale, 2 * scale, 2 * scale, 0, -1, 1)
		draw_sprite_ext(spr_trend_indicator, ord(string_char_at(tag_strs[1], 1)) mod 4, xx, yy + 286 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	} else {
		draw_sprite_ext(spr_tag_back, 4, xx, yy + 286 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	}
	set_tooltip(xx, yy + 286 * scale, 116 * scale, 36 * scale, tag_strs[1])
	if (dream.unlocks[2]) {
		draw_sprite_ext(spr_tag_back, 0, xx, yy + 334 * scale, 2 * scale, 2 * scale, 0, -1, 1)
		draw_sprite_ext(spr_trend_indicator, ord(string_char_at(tag_strs[2], 1)) mod 4, xx, yy + 334 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	} else {
		draw_sprite_ext(spr_tag_back, 4, xx, yy + 334 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	}
	set_tooltip(xx, yy + 334 * scale, 116 * scale, 36 * scale, tag_strs[2])
	if (dream.unlocks[3]) {
		draw_sprite_ext(spr_tag_back, 0, xx, yy + 383 * scale, 2 * scale, 2 * scale, 0, -1, 1)
		draw_sprite_ext(spr_trend_indicator, ord(string_char_at(tag_strs[3], 1)) mod 4, xx, yy + 383 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	} else {
		draw_sprite_ext(spr_tag_back, 4, xx, yy + 383 * scale, 2 * scale, 2 * scale, 0, -1, 1)
	}
	set_tooltip(xx, yy + 383 * scale, 116 * scale, 36 * scale, tag_strs[3])
	gpu_set_tex_filter(1)
	
	var a = mouse_rectangle(xx, yy, 138 * scale, 138 * scale) || mouse_rectangle(xx + 138 * scale, yy + 19 * scale, 318 * scale, 100 * scale)
	if (a) a += mouse_check_button(mb_left)
	
	return a
}