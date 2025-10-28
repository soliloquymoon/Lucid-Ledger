function card_import(){
	var fn = get_open_filename_ext("Lucid Ledger Cards (*.json)|*.json", "", "", "Import Card")
	if (fn = "" || !file_exists(fn)) {
		show_message("Unable to open file!")
		return -1
	}
	var new_card = card_create_from_json(fn)
	return new_card[0]
}