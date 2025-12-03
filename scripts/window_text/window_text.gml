function window_text(){
	draw_sprite(spr_news, 0, 0, 0)
	draw_set_font(Font2)
	draw_set_color(c_white)
	draw_text(196, 294, text_line_break(newspaper_title, 974))
	draw_text(196, 394, text_line_break(newspaper_text, 974))
	
	if (mouse_check_button_pressed(mb_left) && window = WINDOWS.TEXT) window = 0
}