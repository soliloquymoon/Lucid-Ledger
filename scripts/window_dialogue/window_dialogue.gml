function window_dialogue(){
	var text = dialogue_text[dialogue_progress]
	
	if (dialogue_type = 0) {
		draw_set_color(c_white)
		draw_set_font(Font2)
		text = text_line_break(text, 1200)
		//draw character art here
		
		draw_set_alpha(0.5)
		draw_frame_solid(0, 500, 1366, 268)
		draw_set_alpha(1)
		
		draw_text(83, 550, string_copy(text, 0, dialogue_text_progress))
		
		if (dialogue_text_progress = string_length(text)) draw_sprite(spr_next, 0, 1366 - 50, 768 - 50)
	} else if (dialogue_type = 1) {
		draw_set_color(c_white)
		draw_set_font(Font1)
		text = text_line_break(text, 378)
		draw_frame_solid(50, 50, 450, 198)
		draw_text(86, 86, string_copy(text, 0, dialogue_text_progress))
		
		if (dialogue_text_progress = string_length(text)) draw_sprite(spr_next, 0, 450 + 20, 198 + 20)
	}
	
	if (current_time > dialogue_text_timer + 30 && dialogue_text_progress < string_length(text)) {
		dialogue_text_timer = current_time
		dialogue_text_progress++
	}
	
	if (dialogue_text_progress = string_length(text)) {
		if (mouse_check_button_pressed(mb_left)) {
			if (dialogue_progress < array_length(dialogue_text) - 1) {
				dialogue_progress++
				dialogue_text_progress = 0
				dialogue_text_timer = current_time
			} else {
				window = 0
			}
		}
	} else {
		if (mouse_check_button_pressed(mb_left)) dialogue_text_progress = string_length(text)
	}
}