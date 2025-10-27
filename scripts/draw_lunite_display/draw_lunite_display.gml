function draw_lunite_display(xx, yy, amount){
	draw_set_color(0)
	draw_rectangle(xx, yy, xx + 204, yy + 45, 1)
	
	// TODO: draw lunite icon
	
	draw_set_font(Font2)
	draw_text(xx + 50 + 150 / 2 - string_width(string(amount)) / 2, yy + 5, string(amount))
}