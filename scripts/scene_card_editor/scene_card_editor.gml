function scene_card_editor(){
	draw_set_color(0)
	draw_text(10, 10, "card editor scene")
	
	if (!instance_exists(card_in_edit)) card_in_edit = instance_create_depth(0, 0, 0, obj_card)
	if (!instance_exists(edit_name_field)) {
		edit_name_field = instance_create_depth(0, 0, -1, obj_text_edit)
		edit_name_field.str = card_in_edit.card_name
		edit_name_field.x = 1366 / 2 + 100
		edit_name_field.y = 300
		edit_name_field.w = 200
		edit_name_field.h = 50
	}
	
	card_draw(1366 / 2 - 200, 300, card_in_edit)
	
	if (draw_button_size(1366 / 2 + 100, 200, 200, 50, "Import Icon")) import_icon(card_in_edit)
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 280, "Name")
	draw_rectangle(1366 / 2 + 100, 300, 1366 / 2 + 100 + 200 - 1, 300 + 50 - 1, 1)
	
	card_in_edit.card_name = edit_name_field.str
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 380, "Emotion Effect")
	card_in_edit.emotion_effect = draw_number_adjust(1366 / 2 + 100, 400, card_in_edit.emotion_effect)
	
	if (draw_radio_button(1366 / 2 + 100, 450, card_in_edit.emotion_effect_method = 0, "Add")) card_in_edit.emotion_effect_method = 0
	if (draw_radio_button(1366 / 2 + 100, 480, card_in_edit.emotion_effect_method = 1, "Multiply")) card_in_edit.emotion_effect_method = 1
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 520, "Clarity Effect")
	card_in_edit.clarity_effect = draw_number_adjust(1366 / 2 + 100, 540, card_in_edit.clarity_effect)
	
	if (draw_radio_button(1366 / 2 + 100, 590, card_in_edit.clarity_effect_method = 0, "Add")) card_in_edit.clarity_effect_method = 0
	if (draw_radio_button(1366 / 2 + 100, 620, card_in_edit.clarity_effect_method = 1, "Multiply")) card_in_edit.clarity_effect_method = 1
	
	if (draw_button_size(1366 / 2 - 60, 620, 120, 50, "Export")) card_export(card_in_edit)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		instance_destroy(edit_name_field)
		scene_transition(SCENE.TITLE)
	}
}