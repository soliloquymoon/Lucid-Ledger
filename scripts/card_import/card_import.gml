function card_import(){
	var fn = get_open_filename_ext("Lucid Ledger Cards (*.json)|*.json", "", "", "Import Card")
	if (fn = "" || !file_exists(fn)) {
		show_message("Unable to open file!")
		return -1
	}
	var new_card = instance_create_depth(0, 0, 0, obj_card)
	if (card_create_from_json(new_card, fn) = -1) {
		show_message("Create card failed!")
		instance_destroy(new_card)
		return -1
	}
	return new_card
}