function card_import_all(){
	var file = working_directory + "cards" + path_separator() + file_find_first(working_directory + "cards" + path_separator() + "*.json", 0)
	var curr
	
	while (file != working_directory + "cards" + path_separator()) {
		show_debug_message(file)
		curr = card_create_from_json(file)
		array_copy(deck, array_length(deck), curr, 0, array_length(curr))
		file = working_directory + "cards" + path_separator() + file_find_next()
	}
	file_find_close()
	
	show_debug_message("card imported")
}