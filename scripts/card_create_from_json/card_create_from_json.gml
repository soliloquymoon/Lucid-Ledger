function card_create_from_json(card, fn){
	if (!file_exists(fn)) {
		show_debug_message("requested file does not exist!")
		return -1
	}
	var file = file_text_open_read(fn)
	if (file = -1) {
		show_debug_message("file open failed!")
		return -1
	}
	var filestr = ""
	while (!file_text_eof(file)) {
	    filestr += file_text_readln(file);
	}
	file_text_close(file);
	var json_map = json_parse(filestr)
	if (json_map = -1) {
		show_debug_message("json parsing failed!")
		return -1
	}
	show_debug_message(json_map)
	
	try {
		card.icon_identifier = variable_struct_get(json_map, "icon")
		if (card.icon_identifier != "icon_none" && file_exists(working_directory + "card_icons" + path_separator() + card.icon_identifier)) card.icon_sprite = sprite_add(working_directory + "card_icons" + path_separator() + card.icon_identifier, 0, 0, 0, 0, 0)
	
		card.card_name = variable_struct_get(json_map, "name")
		card.emotion_effect = variable_struct_get(json_map, "emotionEffect")
		card.emotion_effect_method = variable_struct_get(json_map, "emotionEffectMethod")
		card.clarity_effect = variable_struct_get(json_map, "clarityEffect")
		card.clarity_effect_method = variable_struct_get(json_map, "clarityEffectMethod")
	}
	catch (e) {
		show_message(string(e))
		return -1
	}
	return 0
}