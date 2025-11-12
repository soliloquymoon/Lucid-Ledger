function dream_load_stages(fn){
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
	
	var return_list = []
	
	try {
		var card_list = json_map
		for (var i = 0; i < array_length(card_list); i++) {
			var item = { dream_name: "", dream_id: "", narrative: "" }
			item.dream_name = variable_struct_get(card_list[i], "name")
			item.dream_id = variable_struct_get(card_list[i], "id")
			item.narrative = variable_struct_get(card_list[i], "narrative")
			array_push(return_list, item)
		}
	}
	catch (e) {
		show_message(string(e))
		return -1
	}
	show_debug_message(return_list)
	return return_list
}