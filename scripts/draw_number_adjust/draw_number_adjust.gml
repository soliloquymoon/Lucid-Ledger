function draw_number_adjust(xx, yy, num, step = 1){
	if (draw_button_size(xx, yy, 30, 30, "-")) num -= step
	draw_set_color(c_white)
	draw_text(xx + 50, yy + 5, string(num))
	if (draw_button_size(xx + 100, yy, 30, 30, "+")) num += step
	return num
}