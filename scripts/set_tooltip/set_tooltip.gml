function set_tooltip(xx, yy, w, h, str){
	if (mouse_rectangle(xx, yy, w, h)) {
		tooltip_x = xx
		tooltip_y = yy
		tooltip_w = w
		tooltip_h = h
		tooltip_str = str
		tooltip_display = 1
	}
}