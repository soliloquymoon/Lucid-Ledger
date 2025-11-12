function card_create_from_json(fn){
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
	
	var is_list = !is_struct(json_map)
	var return_list = []
	
	try {
		if (is_list) {
			var card_list = json_map
			for (var i = 0; i < array_length(card_list); i++) {
				var card = instance_create_depth(0, 0, 0, obj_card)
				card.card_name = variable_struct_get(card_list[i], "name")
				card.card_desc = variable_struct_get(card_list[i], "description")
				card.icon_sprite = variable_struct_get(card_list[i], "icon_index")
				card.emotion_effect = variable_struct_get(card_list[i].effects, "emotion")
				card.clarity_effect = variable_struct_get(card_list[i].effects, "clarity")
				card.stability_effect = variable_struct_get(card_list[i].effects, "stability")
				if (variable_struct_exists(card_list[i], "requisite")) card.requisite = variable_struct_get(card_list[i], "requisite")
				if (variable_struct_exists(card_list[i], "special")) card.requisite = variable_struct_get(card_list[i], "special")
				array_push(return_list, card)
			}
		} else {
			var card = instance_create_depth(0, 0, 0, obj_card)
			card.card_name = variable_struct_get(json_map, "name")
			card.card_desc = variable_struct_get(json_map, "description")
			card.icon_sprite = variable_struct_get(json_map, "icon_index")
			card.emotion_effect = variable_struct_get(json_map.effects, "emotion")
			card.clarity_effect = variable_struct_get(json_map.effects, "clarity")
			card.stability_effect = variable_struct_get(json_map.effects, "stability")
			if (variable_struct_exists(card_list[i], "requisite")) card.requisite = variable_struct_get(card_list[i], "requisite")
			if (variable_struct_exists(card_list[i], "special")) card.requisite = variable_struct_get(card_list[i], "special")
			array_push(return_list, card)
		}
	}
	catch (e) {
		show_message(string(e))
		return -1
	}
	return return_list
}