function draw_tooltip(xx, yy, w, h, str){
	var line_breaks = 0
	for (var i = 1; i <= string_length(str); i++) {
		if (i + line_breaks % 20 = 0) {
			string_insert("\n", str, i)
			line_breaks++
		}
	}
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_frame_solid(mouse_x, mouse_y, string_width(str) + 8, string_height(str) + 8)
	draw_text(mouse_x + 4, mouse_y + 4, str)
}