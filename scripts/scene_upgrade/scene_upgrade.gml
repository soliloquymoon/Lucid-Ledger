function scene_upgrade(){
	draw_set_color(0)
	//draw_text(10, 10, "upgrade scene")
	
	if (!text_skill_shown) {
		set_dialogue(0, text_skill, text_skill_role)
		text_skill_shown = 1
	}
	
	draw_sprite(spr_bg_upgrade, 0, 0, 0)
	
	draw_sprite(spr_upgrades, 0, 146, 92)
	if (mouse_rectangle(146, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[0] < cyberwares_max_lvl[0]) {
			var curr = find_cyberware("arm", cyberwares_level[0] + 1)
			set_popup("Arm", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 0)
			popup_temp_value = 0
		}
	}
	
	draw_sprite(spr_upgrades, 1, 1055, 92)
	if (mouse_rectangle(1055, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[1] < cyberwares_max_lvl[1]) {
			var curr = find_cyberware("eye", cyberwares_level[1] + 1)
			set_popup("Eye", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 1)
			popup_temp_value = 1
		}
	}
	
	draw_sprite(spr_upgrades, 2, 146, 507)
	if (mouse_rectangle(146, 507, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[2] < cyberwares_max_lvl[2]) {
			var curr = find_cyberware("system", cyberwares_level[2] + 1)
			set_popup("System", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 2)
			popup_temp_value = 2
		}
	}
	
	draw_sprite(spr_upgrades, 3, 1055, 507 - 15)
	if (mouse_rectangle(1055, 507 - 15, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[3] < cyberwares_max_lvl[3]) {
			var curr = find_cyberware("circulation", cyberwares_level[3] + 1)
			set_popup("Circulation", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 3)
			popup_temp_value = 3
		}
	}
	
	if (popup_temp_value != -1 && popup_choice = 1) {
		var curr
		if (popup_temp_value = 0) curr = find_cyberware("arm", cyberwares_level[0] + 1)
		else if (popup_temp_value = 1) curr = find_cyberware("eye", cyberwares_level[1] + 1)
		else if (popup_temp_value = 2) curr = find_cyberware("system", cyberwares_level[2] + 1)
		else if (popup_temp_value = 3) curr = find_cyberware("circulation", cyberwares_level[3] + 1)
		if (money >= curr.cost) {
			money -= curr.cost
			cyberwares_level[popup_temp_value]++
		} else {
			show_message("Not enough lunites.")
		}
		popup_choice = -1
		popup_temp_value = -1
	}
	
	
	draw_set_font(Font1)
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		check_money = 1
		scene_exit()
	}
}