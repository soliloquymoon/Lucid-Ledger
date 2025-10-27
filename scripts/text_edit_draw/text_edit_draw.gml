function text_edit_draw(){
	var width = string_width("w") + 1
	var height = string_height("I") + 1
	var inserttext = ""
	draw_set_color(0)
	draw_text(x, y, str)
	
	if (mouse_rectangle(x, y, w, h)) {
		if (mouse_check_button_pressed(mb_left)) {
			focus = 1
			cursor_timer = 0
			
			cursor_pos = 0
			for (var i = 1; i <= string_length(str); i++) {
				if (mouse_x - x > string_width(string_copy(str, 1, i)) - string_width(string_char_at(str, i)) / 2) cursor_pos++
			}
			
			if (cursor_pos < 0) cursor_pos = 0
			if (cursor_pos > string_length(str)) cursor_pos = string_length(str)
		}
	} else {
		if (mouse_check_button_pressed(mb_left)) focus = 0
	}
	
	if (focus) {
		var strwidth = 0
		if (cursor_pos > 0) strwidth = string_width(string_copy(str, 1, cursor_pos))
		if (cursor_timer % 60 < 30) draw_line(x + strwidth, y, x + strwidth, y + height)
		if (keyboard_check_pressed(vk_anykey)) {
			inserttext = keyboard_string
			keyboard_string = ""
		}
		if (!keyboard_check(vk_anykey)) inserttext = ""
		if (inserttext != "") {
			if (ord(inserttext) != 127) {
				str = string_insert(inserttext, str, cursor_pos + 1)
				show_debug_message(ord(inserttext))
				cursor_pos++
			} else {
				str = string_delete(str, cursor_pos, 1)
				cursor_pos--
			}
			inserttext = ""
		}
	}
	cursor_timer++
}