function scene_upgrade(){
	draw_set_color(0)
	//draw_text(10, 10, "upgrade scene")
	
	if (!text_skill_shown) {
		set_dialogue(0, text_skill, text_skill_role)
		text_skill_shown = 1
	}
	
	draw_sprite(spr_bg_upgrade, 0, 0, 0)
	
	draw_lunite_display(39, 18, money)
	
	draw_sprite(spr_upgrades, 0, 146, 92)
	if (mouse_rectangle(146, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[0] < cyberwares_max_lvl[0]) {
			var curr = find_cyberware("arm", cyberwares_level[0] + 1)
			set_popup("Arm", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 0)
			popup_temp_value = 0
		}
	}
	var str_0 = ""
	var cyb_0 = find_cyberware("arm", cyberwares_level[0] + 1)
	str_0 += "Arm level " + string(cyberwares_level[0]) + "\n\n"
	if (cyberwares_level[0] < cyberwares_max_lvl[0]) {
		str_0 += "Next level: " + cyb_0.cyberware_name + "\n"
		str_0 += cyb_0.effect
	} else {
		str_0 += "Maximum level"
	}
	set_tooltip(146, 92, 159, 159, str_0)
	
	draw_sprite(spr_upgrades, 1, 1055, 92)
	if (mouse_rectangle(1055, 92, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[1] < cyberwares_max_lvl[1]) {
			var curr = find_cyberware("eye", cyberwares_level[1] + 1)
			set_popup("Eye", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 1)
			popup_temp_value = 1
		}
	}
	var str_1 = ""
	var cyb_1 = find_cyberware("eye", cyberwares_level[1] + 1)
	str_1 += "Eye level " + string(cyberwares_level[1]) + "\n\n"
	if (cyberwares_level[1] < cyberwares_max_lvl[1]) {
		str_1 += "Next level: " + cyb_1.cyberware_name + "\n"
		str_1 += cyb_1.effect
	} else {
		str_1 += "Maximum level"
	}
	set_tooltip(1055, 92, 159, 159, str_1)
	
	draw_sprite(spr_upgrades, 2, 146, 507)
	if (mouse_rectangle(146, 507, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[2] < cyberwares_max_lvl[2]) {
			var curr = find_cyberware("system", cyberwares_level[2] + 1)
			set_popup("System", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 2)
			popup_temp_value = 2
		}
	}
	var str_2 = ""
	var cyb_2 = find_cyberware("system", cyberwares_level[2] + 1)
	str_2 += "System level " + string(cyberwares_level[2]) + "\n\n"
	if (cyberwares_level[2] < cyberwares_max_lvl[2]) {
		str_2 += "Next level: " + cyb_2.cyberware_name + "\n"
		str_2 += cyb_2.effect
	} else {
		str_2 += "Maximum level"
	}
	set_tooltip(146, 507, 159, 159, str_2)
	
	draw_sprite(spr_upgrades, 3, 1055, 507 - 15)
	if (mouse_rectangle(1055, 507 - 15, 159, 159) && mouse_check_button_released(mb_left)) {
		if (cyberwares_level[3] < cyberwares_max_lvl[3]) {
			var curr = find_cyberware("circulation", cyberwares_level[3] + 1)
			set_popup("Circulation", "Do you want the upgrade " + string(curr.cyberware_name) + " for " + string(curr.cost) + " lunites?", spr_upgrades, 3)
			popup_temp_value = 3
		}
	}
	var str_3 = ""
	var cyb_3 = find_cyberware("circulation", cyberwares_level[3] + 1)
	str_3 += "Circulation level " + string(cyberwares_level[3]) + "\n\n"
	if (cyberwares_level[3] < cyberwares_max_lvl[3]) {
		str_3 += "Next level: " + cyb_3.cyberware_name + "\n"
		str_3 += cyb_3.effect
	} else {
		str_3 += "Maximum level"
	}
	set_tooltip(1055, 507 - 15, 159, 159, str_3)
	
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