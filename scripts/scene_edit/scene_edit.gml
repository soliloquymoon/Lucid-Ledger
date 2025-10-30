function scene_edit(){
	draw_set_color(0)
	
	dream_draw_item(200, 200, dream_in_edit, 0)
	
	var card_width = sprite_get_width(spr_card) * 0.5
	var card_height = sprite_get_height(spr_card) * 0.5
	var spacing = 20
	var card_y = 500
	var card_x = 1366 / 2 - (card_width * array_length(hand) + spacing * (array_length(hand) - 1)) / 2
	
	if (array_length(deck) = 0) deck_fill()
	while(array_length(hand) < 5) draw_card()
	
	var card_sel = -1
	
	for (var i = 0; i < array_length(hand); i++) {
		if (card_draw(card_x + (card_width + spacing) * i, card_y, hand[i]) && mouse_check_button_released(mb_left)) card_sel = i
	}
	
	if (card_sel != -1)	{
		if (show_question("Use this card?")) {
			dream_in_edit.clarity += hand[card_sel].clarity_effect
			dream_in_edit.emotion += hand[card_sel].emotion_effect
			dream_in_edit.stability += hand[card_sel].stability_effect
			array_push(used, hand[card_sel])
			array_delete(hand, card_sel, 1)
			
			dream_in_edit.unlocks[1] = (clarity >= 50)
			dream_in_edit.unlocks[2] = (emotion >= 50)
			dream_in_edit.unlocks[3] = (clarity >= 80 && emotion >= 80)
			
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
			
			dream_value_calculate(dream_in_edit)
		}
	}
	
	draw_set_font(Font2)
	draw_set_color(0)
	draw_text(1366 / 2 + 20, 200, "Clarity: " + string(dream_in_edit.clarity))
	draw_text(1366 / 2 + 20, 300, "Emotion: " + string(dream_in_edit.emotion))
	draw_text(1366 / 2 + 20, 400, "Stability: " + string(dream_in_edit.stability))
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}