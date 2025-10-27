function card_export(card){
	var fn = get_save_filename_ext("Lucid Ledger Cards (*.json)|*.json", card.card_name + ".json", "", "Export Card")
	if (fn = "") return -1
	var contents = {
		name : card.card_name,
		icon : card.icon_identifier,
		emotionEffect : card.emotion_effect,
		emotionEffectMethod : card.emotion_effect_method,
		clarityEffect : card.clarity_effect,
		clarityEffectMethod : card.clarity_effect_method
	}
	var json_string = json_stringify(contents)
	var file = file_text_open_write(fn)
	if (file = -1) {
		show_message("Failed to write file!")
		return -1
	}
	file_text_write_string(file, json_string)
	file_text_close(file)
}