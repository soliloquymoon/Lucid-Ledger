function window_popup(){
	draw_sprite(spr_upgrade_popup, 0, 0, 0)
	
	if (popup_icon != -1 && popup_icon_index != -1) {
		gpu_set_tex_filter(0)
		draw_sprite_stretched(popup_icon, popup_icon_index, 184, 128, 214, 214)
		gpu_set_tex_filter(1)
	}
	
	draw_set_font(Font2)
	draw_set_color(c_white)
	draw_text(414, 214, popup_title)
	
	draw_text(432, 320, text_line_break(popup_text, 720))
	
	draw_sprite(spr_button_buy, 0, 814, 450)
	draw_text(814 + 50, 450 + 20, "Yes")
	if (button_area(814, 450, 156, 70)) {
		popup_choice = 1
		window = 0
	}
	draw_sprite(spr_button_buy, 0, 990, 450)
	draw_text(990 + 55, 450 + 20, "No")
	if (button_area(990, 450, 156, 70)) {
		popup_choice = 0
		window = 0
	}
}