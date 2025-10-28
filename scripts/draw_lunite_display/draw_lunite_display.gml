function draw_lunite_display(xx, yy, amount){
	draw_set_color(0)
	//draw_rectangle(xx, yy, xx + 204, yy + 45, 1)
	draw_sprite_stretched(spr_value_border, 0, xx, yy, 205, 46)
	draw_sprite_stretched(spr_value_back, 0, xx + 3, yy + 3, 205 - 6, 46 - 6)
	
	draw_sprite_ext(spr_lunite, 0, xx - 10, yy - 10, 0.5, 0.5, 0, -1, 1)
	
	draw_set_font(Font2)
	draw_set_color(c_white)
	draw_text(xx + 50 + 150 / 2 - string_width(string(amount)) / 2, yy + 5, string(amount))
}