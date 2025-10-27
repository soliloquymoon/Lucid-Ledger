function draw_radio_button(xx, yy, active, str){
	draw_set_color(0)
	draw_circle(xx + 10, yy + 10, 10, !active)
	draw_text(xx + 30, yy, str)
	return (button_area(xx, yy, 20, 20))
}