function draw_checkbox(xx, yy, active, str){
	draw_set_color(0)
	draw_sprite(spr_checkbox, active, xx, yy)
	draw_set_color(c_white)
	draw_set_font(Font1)
	draw_text(xx + 30, yy, str)
	return (button_area(xx, yy, 20, 20))
}