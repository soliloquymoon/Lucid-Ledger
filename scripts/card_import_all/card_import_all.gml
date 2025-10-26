function card_import_all(){
	var file = file_find_first(working_directory + "cards" + path_separator() + "*.json", 0)
	var curr
	
	while (file != "") {
		curr = instance_create_layer(0, 0, 1, obj_card)
		if (card_create_from_json(curr, file) = -1) instance_destroy(curr)
		else array_push(deck, curr)
		file = file_find_next()
	}
	file_find_close()
}