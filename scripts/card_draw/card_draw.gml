function card_draw(xx, yy, card, scale=1){
	var width = 100 * scale
	var height = 100 * scale
	//draw_card_base
	draw_set_color(c_white)
	draw_rectangle(xx, yy, xx + width - 1, yy + width - 1, 0)
	draw_set_color(0)
	draw_rectangle(xx, yy, xx + width - 1, yy + width - 1, 1)
	
	//draw card icon
	draw_sprite_stretched(spr_card_icon, card.icon_sprite, xx + 10 * scale, yy + 10 * scale, 80 * scale, 80 * scale)
	
	//draw effects
	var emotion_str, clarity_str, stability_str
	emotion_str = string(card.emotion_effect)
	clarity_str = string(card.clarity_effect)
	stability_str = string(card.stability_effect)
	emotion_str = "E" + (card.emotion_effect >= 0 ? "+" : "") + emotion_str
	clarity_str = "C" + (card.clarity_effect >= 0 ? "+" : "") + clarity_str
	stability_str = "S" + (card.stability_effect >= 0 ? "+" : "") + stability_str
	
	draw_text_transformed(xx, yy, emotion_str, scale, scale, 0)
	draw_text_transformed(xx + width - string_width(clarity_str) * scale, yy, clarity_str, scale, scale, 0)
	draw_text_transformed(xx, yy + height - string_height(stability_str), stability_str, scale, scale, 0)
}