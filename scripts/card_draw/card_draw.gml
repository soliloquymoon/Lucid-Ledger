function card_draw(xx, yy, card, scale=1){
	var width = 100 * scale
	var height = 100 * scale
	//draw_card_base
	draw_set_color(0)
	
	draw_sprite_ext(spr_card, 0, xx, yy, 0.5, 0.5, 0, -1, 1)
	
	//draw card icon
	draw_sprite_stretched(spr_card_icon, card.icon_sprite, xx + 19 * scale, yy + 73 * scale, 133 * scale, 94 * scale)
	
	draw_set_color(c_white)
	draw_text_transformed(xx + 18 * scale, yy + 29 * scale, card.card_name, scale, scale, 0)
	
	//draw effects
	var emotion_str, clarity_str, stability_str
	emotion_str = string(card.emotion_effect)
	clarity_str = string(card.clarity_effect)
	stability_str = string(card.stability_effect)
	emotion_str = (card.emotion_effect >= 0 ? "+" : "") + emotion_str
	clarity_str = (card.clarity_effect >= 0 ? "+" : "") + clarity_str
	stability_str = (card.stability_effect >= 0 ? "+" : "") + stability_str
	
	draw_sprite_ext(spr_emotion, 0, xx + 19 * scale, yy + 175 * scale, 0.08 * scale, 0.08 * scale, 0, -1, 1)
	draw_sprite_ext(spr_clarity, 0, xx + 23 * scale, yy + 200 * scale, 0.08 * scale, 0.08 * scale, 0, -1, 1)
	draw_sprite_ext(spr_stability, 0, xx + 16 * scale, yy + 225 * scale, 0.1 * scale, 0.1 * scale, 0, -1, 1)
	
	draw_text_transformed(xx + 62 * scale, yy + 178 * scale, emotion_str, scale, scale, 0)
	draw_text_transformed(xx + 62 * scale, yy + 203 * scale, clarity_str, scale, scale, 0)
	draw_text_transformed(xx + 62 * scale, yy + 228 * scale, stability_str, scale, scale, 0)
	
	set_tooltip(xx, yy, sprite_get_width(spr_card) * 0.5 * scale, sprite_get_height(spr_card) * 0.5 * scale, card.card_desc)
	
	return mouse_rectangle(xx, yy, sprite_get_width(spr_card) * 0.5 * scale, sprite_get_height(spr_card) * 0.5 * scale)
}