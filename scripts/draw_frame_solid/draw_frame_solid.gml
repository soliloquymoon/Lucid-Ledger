function draw_frame_solid(xx, yy, w, h){
	draw_sprite(spr_frame, 0, xx, yy)
	draw_sprite_stretched(spr_frame, 1, xx + 4, yy, w - 8, 4)
	draw_sprite(spr_frame, 2, xx + w - 4, yy)
	draw_sprite_stretched(spr_frame, 3, xx + w - 4, yy + 4, 4, h - 8)
	draw_sprite(spr_frame, 4, xx + w - 4, yy + h - 4)
	draw_sprite_stretched(spr_frame, 5, xx + 4, yy + h - 4, w - 8, 4)
	draw_sprite(spr_frame, 6, xx, yy + h - 4)
	draw_sprite_stretched(spr_frame, 7, xx, yy + 4, 4, h - 8)
	
	draw_sprite_stretched(spr_frame, 8, xx + 4, yy + 4, w - 8, h - 8)
}