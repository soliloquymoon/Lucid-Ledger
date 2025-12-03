function scene_upgrade(){
	draw_set_color(0)
	//draw_text(10, 10, "upgrade scene")
	
	if (!text_skill_shown) {
		set_dialogue(1, text_skill)
		text_skill_shown = 1
	}
	
	draw_sprite(spr_bg_upgrade, 0, 0, 0)
	
	draw_sprite(spr_upgrades, 0, 146, 92)
	if (mouse_rectangle(146, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		
	}
	
	draw_sprite(spr_upgrades, 1, 1055, 92)
	if (mouse_rectangle(1055, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		
	}
	
	draw_sprite(spr_upgrades, 2, 146, 507)
	if (mouse_rectangle(146, 507, 159, 159) && mouse_check_button_released(mb_left)) {
		
	}
	
	draw_sprite(spr_upgrades, 3, 1055, 507)
	if (mouse_rectangle(1055, 507, 159, 159) && mouse_check_button_released(mb_left)) {
		
	}
	
	
	draw_set_font(Font1)
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}