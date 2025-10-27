function draw_number_adjust(xx, yy, num){
	if (draw_button_size(xx, yy, 30, 30, "-")) num--
	draw_set_color(0)
	draw_text(xx + 40, yy + 10, string(num))
	if (draw_button_size(xx + 100, yy, 30, 30, "+")) num++
	return num
}