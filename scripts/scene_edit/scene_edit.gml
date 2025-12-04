function scene_edit(){
	draw_set_color(0)
	draw_sprite(spr_bg_generic, 0, 0, 0)
	
	if (!text_editing_shown) {
		set_dialogue(0, text_editing, text_editing_role)
		text_editing_shown = 1
	}
	
	draw_sprite(spr_ui_edit, 0, 0, 0)
	
	dream_draw_item_edit(160, 78, dream_in_edit, 0)
	
	var card_width = sprite_get_width(spr_card) * 0.5
	var card_height = sprite_get_height(spr_card) * 0.5
	var spacing = 20
	var card_y = 570
	var card_x = 1366 / 2 - (card_width * array_length(hand) + spacing * (array_length(hand) - 1)) / 2
	
	if (array_length(deck) = 0) deck_fill()
	while(array_length(hand) < hand_limit) {
		if (array_length(deck) = 0) deck_fill()
		draw_card()
	}
	
	var card_sel = -1
	
	for (var i = 0; i < array_length(hand); i++) {
		if (card_draw(card_x + (card_width + spacing) * i, card_y - 70 * card_hover[i], hand[i]) && window = 0) {
			if (mouse_check_button_released(mb_left)) card_sel = i
			card_hover[i] = 1
		} else {
			card_hover[i] = 0
		}
	}
	
	if (card_sel != -1)	{
		if (show_question("Use this card?")) {
			var curr_card = hand[card_sel]
			dream_in_edit.clarity += curr_card.clarity_effect
			dream_in_edit.emotion += curr_card.emotion_effect
			dream_in_edit.stability += curr_card.stability_effect
			
			if (curr_card.clarity_effect != 0) {
				var str = string(curr_card.emotion_effect)
				if (str > 0) str = "+" + str
				var type = 0
				if (str > 0) type += 3
				set_edit_popup(1057, 104 - 80, type, str)
			}
			if (curr_card.emotion_effect != 0) {
				var str = string(curr_card.clarity_effect)
				if (str > 0) str = "+" + str
				var type = 1
				if (str > 0) type += 3
				set_edit_popup(1057, 264 - 80, type, str)
			}
			if (curr_card.stability_effect != 0) {
				var str = string(curr_card.stability_effect)
				if (str > 0) str = "+" + str
				var type = 2
				if (str > 0) type += 3
				set_edit_popup(1057, 424 - 80, type, str)
			}
			
			array_push(used, hand[card_sel])
			array_delete(hand, card_sel, 1)
			
			show_debug_message(curr_card.special)
			switch (curr_card.special) {
				case 1: {
					// TODO: make able to replace initial tag
					initial_replacable = 1
					break
				}
				case 2: {
					// Reshuffle hand
					hand_limit++
					for (var i = 0; i < array_length(hand); i++) {
						array_push(used, hand[i])
						array_delete(hand, i, 1)
					}
					while(array_length(hand) < hand_limit) {
						if (array_length(deck) = 0) deck_fill()
						draw_card()
					}
					break
				}
				case 3: {
					// Set emotion and clarity to the higher value
					dream_in_edit.clarity = max(dream_in_edit.emotion, dream_in_edit.clarity)
					dream_in_edit.emotion = dream_in_edit.clarity
					break
				}
			}
			
			dream_in_edit.unlocks[1] = (dream_in_edit.clarity >= 50)
			dream_in_edit.unlocks[2] = (dream_in_edit.emotion >= 50)
			dream_in_edit.unlocks[3] = (dream_in_edit.clarity >= 80 && dream_in_edit.emotion >= 80 && cyberwares_level[2] >= 3)
			
			if (dream_in_edit.stability <= 0) {
				show_message("Dream collapsed!")
				schedule_dream_removal(dream_in_edit)
				for (var i = 0; i < array_length(inventory); i++) {
					if (inventory[i].dream_id = dream_in_edit.dream_id) {
						array_delete(inventory, i, 1)
						break
					}
				}
				scene_exit()
			}
			
			dream_in_edit.recommended_value = dream_value_calculate(dream_in_edit)
		}
	}
	
	draw_set_font(Font2)
	draw_set_color(c_white)
	draw_text(1110, 256, string(dream_in_edit.emotion))
	draw_text(1110, 101, string(dream_in_edit.clarity))
	draw_text(1110, 414, string(dream_in_edit.stability))
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}