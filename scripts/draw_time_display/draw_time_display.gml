function draw_time_display(xx, yy, day, time){
	draw_set_color(0)
	//draw_rectangle(xx, yy, xx + 300, yy + 45, 1)
	
	draw_sprite_stretched(spr_value_border, 0, xx, yy, 150, 45)
	draw_sprite_stretched(spr_value_back, 0, xx + 3, yy + 3, 150 - 6, 45 - 6)
	
	draw_sprite_stretched(spr_icon_border, 0, xx - 20, yy - 10, 50 + 20, 45 + 20)
	draw_sprite_stretched(spr_icon_back, 0, xx - 20 + 3, yy - 10 + 3, 50 + 20 - 6, 45 + 20 - 6)
	
	draw_sprite_ext(spr_day, 0, xx - 8, yy + 3, 0.3, 0.3, 0, -1, 1)
	
	draw_sprite_stretched(spr_value_border, 0, xx + 200, yy, 150, 45)
	draw_sprite_stretched(spr_value_back, 0, xx + 200 + 3, yy + 3, 150 - 6, 45 - 6)
	
	draw_sprite_stretched(spr_icon_border, 0, xx + 200 - 20, yy - 10, 50 + 20, 45 + 20)
	draw_sprite_stretched(spr_icon_back, 0, xx + 200 - 20 + 3, yy - 10 + 3, 50 + 20 - 6, 45 + 20 - 6)
	
	draw_sprite_ext(spr_time, 0, xx + 200 - 4, yy + 3, 0.3, 0.3, 0, -1, 1)
	
	draw_set_font(Font2)
	draw_set_color(c_white)
	draw_text(xx + 150 / 2 - string_width(string(day)) / 2 + 20, yy + 5, string(day))
	draw_text(xx + 200 + 150 / 2 - string_width(string(time)) / 2 + 20, yy + 5, string(time))
}