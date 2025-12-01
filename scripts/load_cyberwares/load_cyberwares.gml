function load_cyberwares(fn){
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
			var item = { cyberware_name: "", effect: "", cyberware_id: "", cost: 0 }
			item.cyberware_name = variable_struct_get(card_list[i], "name")
			item.effect = variable_struct_get(card_list[i], "effect")
			item.cyberware_id = variable_struct_get(card_list[i], "id")
			item.cost = variable_struct_get(card_list[i], "cost")
			array_push(return_list, item)
		}
	}
	catch (e) {
		show_message(string(e))
		return -1
	}
	return return_list
}