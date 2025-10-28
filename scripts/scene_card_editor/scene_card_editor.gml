function scene_card_editor(){
	draw_set_color(0)
	//draw_text(10, 10, "card editor scene")
	
	if (!instance_exists(card_in_edit)) card_in_edit = instance_create_depth(0, 0, 0, obj_card)
	if (!instance_exists(edit_name_field)) {
		edit_name_field = instance_create_depth(0, 0, -1, obj_text_edit)
		edit_name_field.str = card_in_edit.card_name
		edit_name_field.x = 1366 / 2 + 100
		edit_name_field.y = 300
		edit_name_field.w = 200
		edit_name_field.h = 50
	}
	if (!instance_exists(edit_desc_field)) {
		edit_desc_field = instance_create_depth(0, 0, -1, obj_text_edit)
		edit_desc_field.str = card_in_edit.card_desc
		edit_desc_field.x = 1366 / 2 + 100
		edit_desc_field.y = 360
		edit_desc_field.w = 200
		edit_desc_field.h = 50
	}
	
	card_draw(1366 / 2 - 200, 300, card_in_edit)
	
	if (draw_button_size(1366 / 2 + 100, 140, 200, 50, "Import Card")) {
		var temp_card = card_import()
		if (temp_card != -1) {
			instance_destroy(card_in_edit)
			card_in_edit = temp_card
			edit_name_field.str = temp_card.card_name
			edit_desc_field.str = temp_card.card_desc
		}
	}
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 280, "Name")
	draw_rectangle(1366 / 2 + 100, 300, 1366 / 2 + 100 + 200 - 1, 300 + 50 - 1, 1)
	draw_text(1366 / 2 + 100, 350, "Description")
	draw_rectangle(1366 / 2 + 100, 360, 1366 / 2 + 100 + 200 - 1, 360 + 50 - 1, 1)
	
	card_in_edit.card_name = edit_name_field.str
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 380, "Emotion Effect")
	card_in_edit.emotion_effect = draw_number_adjust(1366 / 2 + 100, 400, card_in_edit.emotion_effect)
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 450, "Clarity Effect")
	card_in_edit.clarity_effect = draw_number_adjust(1366 / 2 + 100, 470, card_in_edit.clarity_effect)
	
	draw_set_color(0)
	draw_text(1366 / 2 + 100, 520, "Stability Effect")
	card_in_edit.stability_effect = draw_number_adjust(1366 / 2 + 100, 540, card_in_edit.stability_effect)
	
	if (draw_button_size(1366 / 2 - 60, 620, 120, 50, "Export")) card_export(card_in_edit)
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back")) {
		instance_destroy(edit_name_field)
		instance_destroy(edit_desc_field)
		scene = SCENE.TITLE
	}
}