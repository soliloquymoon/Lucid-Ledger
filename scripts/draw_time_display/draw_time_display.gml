function draw_time_display(xx, yy, day, time){
	draw_set_color(0)
	draw_rectangle(xx, yy, xx + 300, yy + 45, 1)
	draw_line(xx + 97, yy, xx + 97, yy + 45)
	
	draw_set_font(Font2)
	draw_text(xx + 96 / 2 - string_width(string(day)) / 2, yy + 5, string(day))
	draw_text(xx + 97 + 204 / 2 - string_width(string(time)) / 2, yy + 5, string(time))
}