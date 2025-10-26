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
	var num = 0
	while (!file_text_eof(file)) {
	    filestr += file_text_readln(file);
	}
	file_text_close(file);
	var json_map = json_decode(filestr)
	if (json_map = -1) {
		show_debug_message("json parsing failed!")
		return -1
	}
	
	// TODO: json format
	return -1
}