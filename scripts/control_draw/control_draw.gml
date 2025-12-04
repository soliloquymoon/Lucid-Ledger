function control_draw(){
	window_set_cursor(cr_default)
	draw_set_font(Font1)
	draw_clear(c_ltgrey) // bg color
	draw_set_color(0)
	//draw_text(10, 10, "Hello World!")
	
	tooltip_display = 0
	
	switch(scene) {
		case SCENE.TITLE:
			scene_title()
			break
		case SCENE.MAIN:
			scene_main()
			break
		case SCENE.MARKET:
			scene_market()
			break
		case SCENE.EDIT:
			scene_edit()
			break
		case SCENE.SELL:
			scene_sell()
			break
		case SCENE.INVENTORY:
			scene_inventory()
			break
		case SCENE.SETTINGS:
			scene_settings()
			break
		case SCENE.SELL_INNER:
			scene_sell_inner()
			break
		case SCENE.UPGRADE:
			scene_upgrade()
			break
		case SCENE.TAG_CHOOSE:
			scene_tag_choose()
			break
			
		case SCENE.CARDEDITOR:
			scene_card_editor()
			break
	}
	
	if (tooltip_display) {
		draw_tooltip(tooltip_x, tooltip_y, tooltip_w, tooltip_h, tooltip_str)
	}
	
	draw_window()
}