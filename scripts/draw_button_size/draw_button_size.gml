function draw_button_size(xx, yy, w, h, str){
	draw_set_color(0)
	var a = mouse_rectangle(xx, yy, w, h) + mouse_check_button(mb_left)
	if (a) draw_set_color(c_dkgray)
	if (a = 2) draw_set_color(c_gray)
	draw_rectangle(xx, yy, xx + w - 1, yy + h - 1, 0)
	draw_set_color(c_white)
	draw_text(xx + w / 2 - string_width(str) / 2, yy + h / 2 - string_height(str) / 2, str)
	return button_area(xx, yy, w, h)
}