function import_icon(card){
	var fn = get_open_filename_ext("Image Files (*.png, *.jpg, *.jpeg)|*.png;*.jpg;*.jpeg", "", "", "Import Icon")
	show_debug_message(fn)
	if (fn = "" || !file_exists(fn)) {
		show_message("Unable to open file!")
		return -1
	}
	var sprite = sprite_add(fn, 1, 0, 0, 0, 0)
	
	card.icon_sprite = sprite
	card.icon_identifier = filename_name(fn)
}