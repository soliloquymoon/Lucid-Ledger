function load_events(fn){
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
			var item = { event_name: "", event_desc: "", event_id: "", effects: {} }
			item.event_name = variable_struct_get(card_list[i], "name")
			item.event_desc = variable_struct_get(card_list[i], "description")
			item.event_id = variable_struct_get(card_list[i], "id")
			item.effects = variable_struct_get(card_list[i], "effects")
			array_push(return_list, item)
		}
	}
	catch (e) {
		show_message(string(e))
		return -1
	}
	return return_list
}