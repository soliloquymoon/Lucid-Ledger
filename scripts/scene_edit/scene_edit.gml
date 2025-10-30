function scene_edit(){
	draw_set_color(0)
	draw_text(10, 10, "edit scene")
	
	dream_draw_item(200, 200, dream_in_edit, 0)
	
	var card_width = sprite_get_width(spr_card) * 0.5
	var card_height = sprite_get_height(spr_card) * 0.5
	var spacing = 20
	var card_y = 500
	var card_x = 1366 / 2 - (card_width * array_length(hand) + spacing * (array_length(hand) - 1)) / 2
	
	while(array_length(hand) < 5) draw_card()
	if (array_length(deck) = 0) deck_fill()
	
	for (var i = 0; i < array_length(hand); i++) {
		card_draw(card_x + (card_width + spacing) * i, card_y, hand[i])
	}
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		scene_exit()
	}
}