function draw_tooltip(xx, yy, w, h, str){
	draw_set_font(Font1)
	var f_width = string_width(str) + 8
	var f_height = string_height(str) + 8
	var f_x = mouse_x
	var f_y = mouse_y - f_height
	if (f_y < 0) f_y += f_height
	if (f_x + f_width > 1366) f_x -= f_width
	draw_set_color(c_white)
	draw_set_alpha(0.5)
	draw_frame_solid(f_x, f_y, f_width, f_height)
	draw_set_alpha(1)
	draw_text(f_x + 4, f_y + 4, str)
}