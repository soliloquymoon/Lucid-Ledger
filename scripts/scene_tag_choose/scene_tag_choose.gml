function scene_tag_choose(){
	draw_set_color(0)
	draw_sprite(spr_bg_generic, 0, 0, 0)
	
	var tag_sel = draw_tag_list(inventory_tags, 5)
	if (tag_sel != -1) {
		if (dream_in_edit.tags[tag_to_replace].tag_name != "") array_push(inventory_tags, dream_in_edit.tags[tag_to_replace])
		dream_in_edit.tags[tag_to_replace] = inventory_tags[tag_sel]
		array_delete(inventory_tags, tag_sel, 1)
		scene_exit()
	}
	
	draw_set_color(c_white)
	if (array_length(inventory_tags) == 0) draw_text(200, 350, "Empty...")
	
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Back") && window = 0) {
		scene_exit()
	}
}